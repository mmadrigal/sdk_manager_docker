# sdk_manager_docker

## Introduction
This is a Dockerfile to use [NVIDIA SDK Manager](https://docs.nvidia.com/sdk-manager/) on Docker container.

## Requirements
* Docker

## Preparation
### Download NVIDIA SDK Manager
Please download the package of NVIDIA SDK Manager from <https://developer.nvidia.com/nvidia-sdk-manager>.  
And, please put the package of NVIDIA SDK Manager in the same directory as the Dockerfile.  
This time, I used `sdkmanager_1.0.0-5517_amd64.deb`.

### Build Docker image
```
$ docker build -t jetpack .
```

To build a Docker image with a specific SDK Manager version override the ``SDK_MANAGER_VERSION`` variable in the Docker command line

```
$ docker build --build-arg SDK_MANAGER_VERSION=1.0.0-5517 -t jetpack .
```

### Create Docker container
```
$ ./launch_container.sh
```

## Launch NVIDIA SDK Manager
Please launch NVIDIA SDK Manager by the following command.

```
$ sdkmanager
```

or use the cli interface as follows:

```
$ sdkmanager --cli install --responsefile my_response_file.ini
```

You can use the following response file as a template:

<https://docs.nvidia.com/sdk-manager/sdkm-command-line-install/index.html#cli-example-response-file>

You need type user password during setup of NVIDIA SDK Manager.  
In [this Dockerfile](https://github.com/atinfinity/sdk_manager_docker/blob/master/Dockerfile#L75), user password is set to `nvidia`.  

