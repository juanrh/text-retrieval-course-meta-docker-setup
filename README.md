# text-retrieval-course-meta-docker-setup

MeTA toolkit Docker-based setup for the course https://www.coursera.org/learn/text-retrieval

## Setup

Clone the MeTA repo wherever you like. I use `~/git`:

```bash
cd ~/git
git clone https://github.com/meta-toolkit/meta.git
```

Build MeTA 2.2.0 on Docker using Ubuntu 14.04. You only need to do this once:

```bash
source docker/bashrc.sh
# build MeTA on ~/git/meta and run unit tests. You can also pass an
# optional argument to this command for the path where you cloned meta
meta_build
```

Use the following commands to launch a container for Ubuntu 14.04 with the prerequisites for MeTA:

```
# Launch a container for Ubuntu 14.04 with the prerequisites for MeTA, with
# the MeTA installation mounted at /opt/meta. You can also pass an
# optional argument to this command for the path where you cloned meta
meta_container_run

# Launch another shell in the MeTA container
meta_container_shell
# Launch another shell in the MeTA container, running as root
meta_container_shell_root
```