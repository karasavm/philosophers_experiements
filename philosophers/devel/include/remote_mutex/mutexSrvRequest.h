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
 * Auto-generated by genmsg_cpp from file /home/mike/svn/nasia/trunk/philosophers/src/remote_mutex/srv/mutexSrv.srv
 *
 */


#ifndef REMOTE_MUTEX_MESSAGE_MUTEXSRVREQUEST_H
#define REMOTE_MUTEX_MESSAGE_MUTEXSRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace remote_mutex
{
template <class ContainerAllocator>
struct mutexSrvRequest_
{
  typedef mutexSrvRequest_<ContainerAllocator> Type;

  mutexSrvRequest_()
    : requestor()
    , requestType(0)  {
    }
  mutexSrvRequest_(const ContainerAllocator& _alloc)
    : requestor(_alloc)
    , requestType(0)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _requestor_type;
  _requestor_type requestor;

   typedef uint8_t _requestType_type;
  _requestType_type requestType;


    enum { TYPE_LOCK = 1 };
     enum { TYPE_UNLOCK = 2 };
     enum { TYPE_POLL = 3 };
 

  typedef boost::shared_ptr< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct mutexSrvRequest_

typedef ::remote_mutex::mutexSrvRequest_<std::allocator<void> > mutexSrvRequest;

typedef boost::shared_ptr< ::remote_mutex::mutexSrvRequest > mutexSrvRequestPtr;
typedef boost::shared_ptr< ::remote_mutex::mutexSrvRequest const> mutexSrvRequestConstPtr;

// constants requiring out of line definition

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::remote_mutex::mutexSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace remote_mutex

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "92c5b59df7e6f9662ed83c871edc5264";
  }

  static const char* value(const ::remote_mutex::mutexSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x92c5b59df7e6f966ULL;
  static const uint64_t static_value2 = 0x2ed83c871edc5264ULL;
};

template<class ContainerAllocator>
struct DataType< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "remote_mutex/mutexSrvRequest";
  }

  static const char* value(const ::remote_mutex::mutexSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string requestor\n\
uint8 requestType\n\
uint8 TYPE_LOCK = 1\n\
uint8 TYPE_UNLOCK = 2\n\
uint8 TYPE_POLL = 3\n\
\n\
";
  }

  static const char* value(const ::remote_mutex::mutexSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.requestor);
      stream.next(m.requestType);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct mutexSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::remote_mutex::mutexSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::remote_mutex::mutexSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "requestor: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.requestor);
    s << indent << "requestType: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.requestType);
  }
};

} // namespace message_operations
} // namespace ros

#endif // REMOTE_MUTEX_MESSAGE_MUTEXSRVREQUEST_H
