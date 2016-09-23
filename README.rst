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
and mapping `SLAM`_ across multiple platforms and sensor configurations. This
repository provides Cartographer SLAM for the `Toyota HSR`_ via
`Cartographer ROS`_.

.. _Cartographer: https://github.com/googlecartographer/cartographer
.. _Cartographer ROS: https://github.com/googlecartographer/cartographer_ros
.. _SLAM: https://en.wikipedia.org/wiki/Simultaneous_localization_and_mapping
.. _Toyota HSR: http://www.toyota-global.com/innovation/partner_robot/family_2.html


Setup
=====

If you're starting from scratch::

  # Install wstool and prepare rosdep.
  sudo apt-get update
  sudo apt-get install -y python-wstool python-rosdep ninja-build

  # Create a catkin workspace
  mkdir ~/workspace
  cd workspace
  wstool init

  # Prepare the workspace and fetch the code
  wstool merge https://raw.githubusercontent.com/ToyotaResearchInstitute/cartographer_hsr/master/cartographer_hsr.rosinstall
  wstool update

  # Install system dependencies
  rosdep update
  rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y

  # Build and install.
  catkin_make_isolated --install --use-ninja
  source install_isolated/setup.bash
