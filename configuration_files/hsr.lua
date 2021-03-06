-- Copyright 2016 Toyota Research Institute
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  map_frame = "map",
  tracking_frame = "base_footprint",
  published_frame = "odom",
  odom_frame = "odom",
  provide_odom_frame = false,
  use_odometry_data = false,
  use_constant_odometry_variance = true,
  constant_odometry_translational_variance = 1e-7,
  constant_odometry_rotational_variance = 1e-7,
  publish_occupancy_grid = true,
  use_horizontal_laser = true,
  use_horizontal_multi_echo_laser = false,
  horizontal_laser_min_range = 0.,
  horizontal_laser_max_range = 20.,
  horizontal_laser_missing_echo_ray_length = 5.,
  num_lasers_3d = 0,
  lookup_transform_timeout_sec = 0.1,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
}

options.map_builder.trajectory_builder_2d.submaps.resolution = 0.05
options.map_builder.use_trajectory_builder_2d = true
options.map_builder.trajectory_builder_2d.use_imu_data = false
options.map_builder.trajectory_builder_2d.use_online_correlative_scan_matching = true

return options
