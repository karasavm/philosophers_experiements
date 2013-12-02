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
#ifndef WATCHED_PHILOSOPHER_H
#define WATCHED_PHILOSOPHER_H
#include "ros/ros.h"
#include "watchdog_timer/Watchdog.h"

#include <dining_philosopher/Philosopher.h>


/**
 * A single dinning philosopher watched by a watchdog.
 */
class WatchedPhilosopher: public Philosopher {
  public:
    WatchedPhilosopher(int id, std::string fork_counter, int64_t num_forks);

    virtual void start();
    
    virtual void nowEating(){wdt_.reset();};  
  private:
    //The watchdog timer
    Watchdog wdt_;

};

#endif // WATCHED_PHILOSOPHER_H
