/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/mike/svn/nasia/trunk/philosophers/src/state_manager_communications/srv/registerNodeSrv.srv
 *
 */


#ifndef STATE_MANAGER_COMMUNICATIONS_MESSAGE_REGISTERNODESRVREQUEST_H
#define STATE_MANAGER_COMMUNICATIONS_MESSAGE_REGISTERNODESRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace state_manager_communications
{
template <class ContainerAllocator>
struct registerNodeSrvRequest_
{
  typedef registerNodeSrvRequest_<ContainerAllocator> Type;

  registerNodeSrvRequest_()
    : nodeName()  {
    }
  registerNodeSrvRequest_(const ContainerAllocator& _alloc)
    : nodeName(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _nodeName_type;
  _nodeName_type nodeName;




  typedef boost::shared_ptr< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct registerNodeSrvRequest_

typedef ::state_manager_communications::registerNodeSrvRequest_<std::allocator<void> > registerNodeSrvRequest;

typedef boost::shared_ptr< ::state_manager_communications::registerNodeSrvRequest > registerNodeSrvRequestPtr;
typedef boost::shared_ptr< ::state_manager_communications::registerNodeSrvRequest const> registerNodeSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace state_manager_communications

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'state_manager_communications': ['/home/mike/svn/nasia/trunk/philosophers/src/state_manager_communications/msg'], 'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fa90f177c62ffd4f5a57999c98f4104f";
  }

  static const char* value(const ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfa90f177c62ffd4fULL;
  static const uint64_t static_value2 = 0x5a57999c98f4104fULL;
};

template<class ContainerAllocator>
struct DataType< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "state_manager_communications/registerNodeSrvRequest";
  }

  static const char* value(const ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string nodeName\n\
\n\
";
  }

  static const char* value(const ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nodeName);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct registerNodeSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::state_manager_communications::registerNodeSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "nodeName: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.nodeName);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STATE_MANAGER_COMMUNICATIONS_MESSAGE_REGISTERNODESRVREQUEST_H