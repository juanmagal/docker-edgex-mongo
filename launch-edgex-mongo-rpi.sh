#!/bin/sh

# Copyright 2017 Cavium Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

rm /var/lib/mongodb/mongod.lock 

rm /data/db/mongod.lock

set -e

#mongod --repair

mongod --journal --smallfiles &

while true; do
  mongo /edgex/mongo/config/init_mongo_rpi.js && break
  sleep 5
done

wait

