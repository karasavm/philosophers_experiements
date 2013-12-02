/*
 *	Copyright (C) 2013 by Pandora Robotics Team, Aristotle Univeristy of Thessaloniki, Greece
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
#include "erratic_state_changer/ErraticStateChanger.h"
#include "state_manager_communications/robotModeMsg.h"

ErraticStateChanger::ErraticStateChanger(int max_period): 
	waitingForTransition_(false), stateOFF_(false), maxWaitTime_(max_period), justStarted_(false), firstTime_(true)
	 {
		
}

void ErraticStateChanger::startErraticBehaviour() {
	while (ros::ok()) {
		if (!stateOFF_ && !waitingForTransition_ && !justStarted_ && !firstTime_) {
			// Not waiting for transition and at STATE_ON means that we 
			// should present some erratic behavior
		    
			firstTime_ = false;
		    //First sample time
		    double slTime = (rand() % (maxWaitTime_ *100)) / 100.;
		    ROS_INFO("Will switch off in %f", slTime);
		    // then sleep for that time
		    ros::Duration sl(slTime); 
			sl.sleep();
			ROS_INFO("Switch off now");
			state_manager_communications::robotModeMsg msg;
			msg.mode = state_manager_communications::robotModeMsg::MODE_OFF;
		    // and now change the state
		    transitionToState(msg);		    
			ros::spinOnce();
		    justStarted_ = true;		    
		} else if (stateOFF_ && !waitingForTransition_) {
			ROS_INFO("Oups I turned it off, I am turning it on immediately");
			state_manager_communications::robotModeMsg msg;
			msg.mode = state_manager_communications::robotModeMsg::MODE_NORMAL;
			transitionToState(msg);
		} 

		ros::Duration d(.1); 
		d.sleep();
		ros::spinOnce();
  }
}

void ErraticStateChanger::startTransition(const state_manager_communications::robotModeMsg &newState) {
  if (newState.mode == state_manager_communications::robotModeMsg::MODE_OFF) {
    stateOFF_ = true;
  } else {
    stateOFF_ = false;
  }
  waitingForTransition_ = true;
  transitionComplete(newState);
}

void ErraticStateChanger::completeTransition() {
  waitingForTransition_ = false;  
  justStarted_ = false;
  firstTime_ = false;
}
