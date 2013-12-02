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
#include "dining_philosopher/PhilosopherStats.h"
#include "ros/assert.h"



PhilosopherStats::PhilosopherStats(int counter) {
  sampling_period_ = .5; 
  for (int i=0;i<counter;i++) {
  	myVector.push_back(
		nh_.subscribe<dining_philosopher_communications::hungerMsg>("/hungerLevel/" + boost::lexical_cast<std::string>(i), 100,
			boost::bind(&PhilosopherStats::receiveHungerLevels, this, _1, i)
		)
	);
  }
  sampler_ = nh_.createTimer(ros::Duration(sampling_period_), &PhilosopherStats::sampler, this);
  sample_seq_id_ = 0;
  mean_hunger_level_ = 0;
  mean_starving_ = 0;
  if (!nh_.getParam("/philosophers/starvationThreshold",starvation_threshold_))
	exit(-1); 
}

void PhilosopherStats::receiveHungerLevels(const dining_philosopher_communications::hungerMsg::ConstPtr& msg, const int philosopherId) {
  hunger_levels_[philosopherId] = msg->hungerLevel;
  ROS_ASSERT_MSG(!isnan(msg->hungerLevel) , "Whats wrong with philosopher %d being hungry %f", philosopherId, msg->hungerLevel); 
}

void PhilosopherStats::sampler(const ros::TimerEvent& event) {
  uint64_t old_num_of_samples = sample_seq_id_;
  sample_seq_id_++;
  
  double hunger_sum = 0;
  uint64_t starving_count = 0;
  
  for (std::map<uint64_t, double>::iterator philosopher = hunger_levels_.begin();
                    philosopher != hunger_levels_.end(); ++philosopher) {
    const uint64_t phil_id = philosopher->first;
    const double hunger = philosopher->second;
    // Sum the hunger level
    hunger_sum += hunger;
    
    // Count starving philosophers
    if (hunger > starvation_threshold_) { 
      starving_count++;
    }
    
    // Count time, but first initialize
    if (starvation_starting_time_.count(phil_id) == 0) {
      starvation_starting_time_[phil_id] = -1;
      sum_starvation_time_[phil_id] = 0;
      count_starvations_[phil_id] = 0;
    }
    
    if (hunger <= starvation_threshold_ 
                          && starvation_starting_time_[phil_id] != -1) {
      // We are now not hungry, count time
      count_starvations_[phil_id]++;
      const double time = sample_seq_id_ - starvation_starting_time_[phil_id];
      sum_starvation_time_[phil_id] += time;
      starvation_starting_time_[phil_id] = -1;
    } else if (hunger > starvation_threshold_ 
                          && starvation_starting_time_[phil_id] == -1) {
      // We just starved...
      starvation_starting_time_[phil_id] = sample_seq_id_;
    }      
  }
  // Calculate mean hunger level
  if (hunger_levels_.size() != 0){
	hunger_sum /= hunger_levels_.size();
  }else{
	hunger_sum = 0;
  }
  mean_hunger_level_ = (mean_hunger_level_ * old_num_of_samples + hunger_sum) / double(sample_seq_id_);
  
  // Calculate mean starving percentage
  const double starving_avg = double(starving_count) / double (hunger_levels_.size());
  mean_starving_ = (mean_starving_ * old_num_of_samples + starving_avg) /  double(sample_seq_id_);
}

void PhilosopherStats::outputStats() {
  // Calculate avg time
  double num_starvations = 0;
  double total_time = 0;
  for (std::map<uint64_t, double>::iterator philosopher = sum_starvation_time_.begin();
                    philosopher != sum_starvation_time_.end(); ++philosopher) {
    const uint64_t phil_id = philosopher->first;
    num_starvations += count_starvations_[phil_id];
    total_time += sum_starvation_time_[phil_id];
    if (starvation_starting_time_[phil_id] != -1) {
      num_starvations++;
      total_time += sample_seq_id_ - starvation_starting_time_[phil_id];
    }
  }
  const double avg_starvation_duration = total_time / num_starvations / sampling_period_;
  printf("Means %f, %f, %f\n", avg_starvation_duration, mean_hunger_level_, mean_starving_);  
}
