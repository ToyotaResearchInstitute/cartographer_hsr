.. Copyright 2016 Toyota Research Institute

.. Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

.. http://www.apache.org/licenses/LICENSE-2.0

.. Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

===================================
Cartographer ROS for the Toyota HSR
===================================

Purpose
=======

`Cartographer`_ is a system that provides real-time simultaneous localization
and mapping (`SLAM`) across multiple platforms and sensor configurations. This
repository provides Cartographer SLAM for the `Toyota HSR`_ via
`Cartographer ROS`_.

.. _Cartographer: https://github.com/googlecartographer/cartographer
.. _Cartographer ROS: https://github.com/googlecartographer/cartographer_ros
.. _SLAM: https://en.wikipedia.org/wiki/Simultaneous_localization_and_mapping
.. _Toyota HSR: http://www.toyota-global.com/innovation/partner_robot/family_2.html


Setup
=====

If you're starting from scratch::

  # Install system dependencies
  sudo apt-get update
  sudo apt-get install -y \
    cmake \
    g++ \
    git \
    google-mock \
    libboost-all-dev \
    libeigen3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    liblua5.2-dev \
    libprotobuf-dev \
    libsuitesparse-dev \
    libwebp-dev \
    ninja-build \
    protobuf-compiler \
    python-sphinx \
    python-wstool


  # Create a catkin workspace
  mkdir -p ~/workspace/src
  cd workspace/src
  wstool init

  # Prepare the workspace and fetch the code
  wstool merge https://raw.githubusercontent.com/ToyotaResearchInstitute/cartographer_hsr/master/cartographer_hsr.rosinstall
  wstool update

  # Build and install.
  catkin_make_isolated --install --use-ninja -C ~/workspace
  source install_isolated/setup.bash

Demo
====

After completing setup::

  # Get an HSR .bag file for 2D demo.
  wget -P ~/Downloads https://s3-us-west-1.amazonaws.com/cartographer-hsr/cartographer_hsr_example.bag
  # Run the demo for 2D. This will start rviz and play the bag file automatically.
  roslaunch cartographer_hsr hsr_demo_2d.launch bag_filename:=${HOME}/Downloads/cartographer_hsr_example.bag
  # Get an HSR .bag file for 3D demo.
  wget -P ~/Downloads https://s3-us-west-1.amazonaws.com/cartographer-hsr/cartographer_hsr_example_3d.bag
  # Run the demo for 3D. This will start rviz and play the bag file automatically.
  roslaunch cartographer_hsr hsr_demo_3d.launch bag_filename:=${HOME}/Downloads/cartographer_hsr_example_3d.bag
