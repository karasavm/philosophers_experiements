/*
 *	Copyright (C) 2012 Aristotle Univeristy of Thessaloniki, Greece
 *
 *	Permission is hereby granted, free of charge, to any person obtaining a copy
 *	of this software and associated documentation files (the "Software"), to deal
 *	in the Software without restriction, including without limitation the rights
 *	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *	copies of the Software, and to permit persons to whom the Software is
 *	furnished to do so, subject to the following conditions:
 *
 *	The above copyright notice and this permission notice shall be included in
 *	all copies or substantial portions of the Software.
 *
 *	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *	THE SOFTWARE.
 */
 #include <stdlib.h>
 #include <tr1/random>
 
 #include "dining_philosopher/Philosopher.h"
 #include "remote_counter/countingSrv.h"
 
Philosopher::Philosopher(int id, std::string fork_counter, int64_t num_forks) 
    : spinner_(2), id_(id), transitioning_(false), num_forks_(num_forks),
    philosopherState_(STATE_NOTHING) {
  
  spinner_.start();
  
  srand(id_ * ros::Time::now().toNSec());
  nh_.param<int>("/philosophers/max_eating_time", max_eating_time_ ,3);
  nh_.param<int>("/philosophers/max_thinking_time", max_thinking_time_ ,3);
  ROS_INFO("Max thinking time %d Max eating time %d", max_eating_time_, max_thinking_time_);
  if (!nh_.getParam("/philosophers/starvationThreshold",STARVATION_LEVEL))
	exit(-1); 
  
  std::string topicName = "/hungerLevel/" + boost::lexical_cast<std::string>(id);
  pub_ = nh_.advertise<dining_philosopher_communications::hungerMsg>(topicName, 1);

  nh_.param<double>("/philosophers/hunger_increase_rate", hunger_increase_rate_ ,1);
  nh_.param<double>("/philosophers/hunger_decrease_ratio", hunger_decrease_ratio_ ,.8);
  
  timer_ = nh_.createTimer(ros::Duration(0.5), &Philosopher::postMsg, this);
 
  std::string remoteCounterName = "/counter/"+fork_counter;
  int retries = 0;
  while (!ros::service::waitForService(remoteCounterName, ros::Duration(.1)) && ros::ok()) {
		retries++;
		if (retries > 10) 
			ROS_ERROR("Could not find %s",remoteCounterName.c_str());
		ros::spinOnce();
	}
	
	client_ = nh_.serviceClient<remote_counter::countingSrv>(remoteCounterName, true);
  
  std::tr1::ranlux64_base_01 engine;
  engine.seed(id_ * ros::Time::now().toNSec());
  std::tr1::normal_distribution<double> normal(2.0, 1.0);
  
  hunger_level_ = normal(engine); 
  
  if (hunger_level_ < 0) {
	  hunger_level_ = 0;
  }
  
  ROS_INFO("Hunger level initialized at %f", hunger_level_);
  last_hunger_update_ = ros::Time::now();
 
 ROS_INFO("Philosopher Initialized");
}

void Philosopher::start() {
  ROS_INFO("Philosopher Started...");  
  while (ros::ok()) {
    if (transitioning_) {
      transitioning_ = false;
      transitionComplete(currentState_);
    }
    if (philosopherState_ == STATE_NOTHING) {
      ros::Duration d(.1); 
      philosopherIState_ = ISTATE_NOTHING;
      d.sleep(); // Sleep a bit and wait if our status changed.
    } else {
      stateActive();
      recalculateHunger();
      philosopherIState_ = ISTATE_WAITING;
    }
  }
}

void Philosopher::stateActive() {
  recalculateHunger();
  philosopherIState_ = ISTATE_THINKING;
  think();
  if (transitioning_) return;  
  philosopherIState_ = ISTATE_WAITING;
  eat();
}

void Philosopher::think() {
  ROS_INFO("Philosopher %d Thinking...", id_);
  ros::Duration d((rand() % (max_thinking_time_ * 100) / 100.));
  d.sleep();
}

void Philosopher::eat() {
  ROS_INFO("Philosopher %d wants to eat", id_);
  bool have_forks = false;
  while (!have_forks && !transitioning_ && ros::ok()) {
      have_forks = getForks();
  };
  if (!transitioning_ && ros::ok()){;
    nowEating();
    recalculateHunger();
    philosopherIState_ = ISTATE_EATING;
    ros::Duration d((rand() % (max_eating_time_ *100)) / 100.);
    d.sleep();
    recalculateHunger();
    philosopherIState_ = ISTATE_WAITING;
    nowEating();
  }
  if (have_forks) giveForks();
}

void Philosopher::completeTransition() {
  // Nothing here!
}

void Philosopher::startTransition(const state_manager_communications::robotModeMsg &newState) {
  currentState_ = newState; 
  if (newState.mode == state_manager_communications::robotModeMsg::MODE_OFF) {
    philosopherState_ = STATE_NOTHING;
  } else {
    philosopherState_ = STATE_ACTIVE;
  }
  transitioning_ = true;
}

bool Philosopher::getForks() {
  return forkCounter(-num_forks_);
}

void Philosopher::giveForks() {
  while (!forkCounter(num_forks_) && ros::ok());
}

bool Philosopher::forkCounter(int64_t count) {
  remote_counter::countingSrv srv;
  
  srv.request.count = count;
  
  if (client_.call(srv)) {
    if (srv.response.ok) {
      return true;
    } else {
      ros::Duration d(.05);
      d.sleep();
      return false;
    }
	} else {
		ROS_ERROR("Failed to call counter");
		return false;
	}
}
	
void Philosopher::postMsg(const ros::TimerEvent& event) {
  recalculateHunger();
  //hungerLevelMsg_.philosopherId = id_;
  hungerLevelMsg_.hungerLevel = hunger_level_;
  pub_.publish(hungerLevelMsg_);
}

void Philosopher::recalculateHunger() {
  ros::Duration length = ros::Time::now() - last_hunger_update_;
  double secs = length.toSec();
  
  if (philosopherIState_ == ISTATE_EATING) {
    hunger_level_ *= pow(hunger_decrease_ratio_, secs);
  } else {
    hunger_level_ += hunger_increase_rate_ * secs;
  }
  
  if (hunger_level_ < 0 || hunger_level_ != hunger_level_) hunger_level_ = 0; //less that 0 or NaN
  last_hunger_update_ = ros::Time::now();
}
