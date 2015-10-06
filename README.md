# 47 Degrees Docker Images

This docker images compilation helps 47 Degrees Team and whoever would be interested to deploy his software infrastructure.

This is a work in progress and in several cases these docker images have been based on the work of the community.

## How this Work is Organized

We have decided to organize all the Docker images in a single Github repository because we think is more easy to maintain. It's true that in this way we can not configure properly the webhooks to connect this code with [our Docker Hub](https://hub.docker.com/u/47deg). But as we said previously, this is a WIP.

Additionally we can say that all the docker images organization is hierarchical in this way:

	- [phusion/baseimage](https://github.com/phusion/baseimage-docker)
		|- [baseimage](baseimage/README.md)
			|- [java7](java7/README.md)
				|- [cassandra](cassandra/README.md)
				|- [kafka](kafka/README.md)
				|- [spark](spark/README.md)
				|- [zookeeper](zookeeper/README.md)
			|- [java8](java8/README.md)
			|- [opscenter](opscenter/README.md)
	- [sequenceiq/pam:centos-6.5](https://github.com/sequenceiq/docker-pam)
		|- [yarn-cluster](yarn-cluster/README.md)

#License

Copyright (C) 2015 47 Degrees, LLC [http://47deg.com](http://47deg.com) [hello@47deg.com](mailto:hello@47deg.com)

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.