# text-retrieval-course-meta-docker-setup

MeTA toolkit Docker-based setup for the course https://www.coursera.org/learn/text-retrieval

## Setup

You need Docker installed in your machine.

Choose a directory to use as the __course home__, where we'll put both this repo, the meta repo, and the assignments. I use `~/git/text-retrieval-course`. Clone this repo there.

Now build MeTA 2.2.0 on Docker using Ubuntu 14.04. You only need to do this once. This also clone MeTA in the course home (_note_ this will delete any `meta` directory in your course home).

```bash
# add the meta_ commands to your shell
source text-retrieval-course-meta-docker-setup/docker/bashrc.sh
# build MeTA on ~/git/text-retrieval-course/meta and run unit tests. You can also pass an
# optional argument to this command for the course home path
meta_build
```

Use the following commands to launch a container for Ubuntu 14.04 with the prerequisites for MeTA:

```bash
# add the meta_ commands to your shell
source text-retrieval-course-meta-docker-setup/docker/bashrc.sh

# Launch a container for Ubuntu 14.04 with the prerequisites for MeTA, with
# the MeTA installation mounted at /opt/course/meta. You can also pass an
# optional argument to this command for the course home path
meta_container_run

# Launch another shell in the MeTA container
meta_container_shell
# Launch another shell in the MeTA container, running as root
meta_container_shell_root
```

To build an assignment, copy the assignment folder to your course root and run:

```bash
# add the meta_ commands to your shell
source text-retrieval-course-meta-docker-setup/docker/bashrc.sh

meta_container_run
# Follow the course instructions from the container
cd Assignment_1
./setup.sh
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j8
```
