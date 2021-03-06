/*
 *	Copyright (C) 2012 by Pandora Robotics Team, Aristotle Univeristy of Thessaloniki, Greece
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

#include "remote_counter/RemotePositiveCounter.h"


RemotePositiveCounter::RemotePositiveCounter(std::string counterName, 
                                     int64_t initialValue) {	
	/*
	_name = "/counter/" + counterName;
	_counterServer = _nh.advertiseService(_name, &RemotePositiveCounter::counterCallback, this);
	//timerValue = initialValue;
	
	int temp;
	
	if (!_nh.getParam("/philosophers/total_forks",temp)) exit(-1);
	
	timerValue = (int64_t)temp;
	*/
	_name = "/counter/" + counterName;
	_counterServer = _nh.advertiseService(_name, &RemotePositiveCounter::counterCallback, this);
	timerValue = initialValue;
	
}

bool RemotePositiveCounter::counterCallback(
        remote_counter::countingSrv::Request &req,
        remote_counter::countingSrv::Response &res){
  if (timerValue + req.count < 0) {
    res.ok = false;
  } else {
    res.ok = true;
    timerValue += req.count;
   // ROS_INFO("Counter changed by %s! New value is %lld ",(*req.__connection_header)["callerid"].c_str(), timerValue);
  }
	lastActivity = ros::Time::now();
	return true;
}

int64_t RemotePositiveCounter::getValue() {
	return timerValue;
	}
	
void RemotePositiveCounter::setValue(int value, bool setTimestamp) {
	timerValue = value;
	if (setTimestamp)
		lastActivity = ros::Time::now();
	}
	
ros::Time RemotePositiveCounter::getLastActivity() {
	return lastActivity;
}

