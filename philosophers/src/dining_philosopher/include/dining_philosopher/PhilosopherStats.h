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
#ifndef PHILOSOPHER_H
#define PHILOSOPHER_H
#include "ros/ros.h"
#include "dining_philosopher_communications/hungerMsg.h"

// An class that aggregates philosopher hunger statistics from the system.
class PhilosopherStats {
  public:
    PhilosopherStats(int counter);
  
    virtual void outputStats();
  protected:
    // Sample hunger statistics
    void sampler(const ros::TimerEvent& event);
    
    // A ROS timer to sample the current hunger levels.
    ros::Timer sampler_;
    
    // The sample sequence ID
    uint64_t sample_seq_id_;
  
    // The mean hunger level, so far
    double mean_hunger_level_;  
    
    // The mean percent of philosophers that are out of range
    double mean_starving_;
    
    // The threshold above which we consider that philosophers are
    // starving.
    double starvation_threshold_;
  private:
    //ROS vector for the philosopherStats subscribers
    std::vector <ros::Subscriber> myVector;
    // ROS specific handles
    ros::NodeHandle nh_;
    ros::Subscriber hunger_msg_;
  
    // The hunger level of each philosopher
    std::map<uint64_t, double> hunger_levels_;
    
    // The period of one sample.
    double sampling_period_;
    
    // Contains the time each philosopher started starving
    // or -1 if the philosopher currently doesn't starve.
    std::map<uint64_t, int64_t> starvation_starting_time_;
    
    // Contains the average time that each philosopher starves
    // (if she starves).
    std::map<uint64_t, double> sum_starvation_time_;
    std::map<uint64_t, uint64_t> count_starvations_;    
    
    // Callback when a hunger level is received.
    void receiveHungerLevels(const dining_philosopher_communications::hungerMsg::ConstPtr& msg, const int philosopherId);
    
    // DISALLOW_COPY_AND_ASSIGN
    PhilosopherStats(const PhilosopherStats &);
    void operator=(const PhilosopherStats&);
};

#endif // PHILOSOPHER_H
