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
 
 #include "dining_philosopher/MonitoredPhilosopher.h"
 
MonitoredPhilosopher::MonitoredPhilosopher(int id, std::string fork_counter,
                                      int64_t num_forks) :
    WatchedPhilosopher(id, fork_counter, num_forks){
		
	timer_ = nh_.createTimer(ros::Duration(1),&MonitoredPhilosopher::publishDiagnostics,this);
		
	updater_.setHardwareID("none");
	updater_.add("Philosopher status", this, &MonitoredPhilosopher::hungerDiagnostics);
}

void MonitoredPhilosopher::start() {
  WatchedPhilosopher::start();
}

void MonitoredPhilosopher::hungerDiagnostics(diagnostic_updater::DiagnosticStatusWrapper &stat) {
	if (hunger_level_ < .8 * STARVATION_LEVEL) {
		stat.summary(diagnostic_msgs::DiagnosticStatus::OK, "Philosopher in good condition.");
	} else if (hunger_level_ <  STARVATION_LEVEL) {
		stat.summary(diagnostic_msgs::DiagnosticStatus::WARN, "Philosopher is getting hunger");
	} else {
		stat.summary(diagnostic_msgs::DiagnosticStatus::ERROR, "Philosopher is starving");
	}
	stat.add("Hunger Level", hunger_level_);
}

void MonitoredPhilosopher::publishDiagnostics(const ros::TimerEvent& ) {
	updater_.update();
}
