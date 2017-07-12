### Deadline in Docker

This project is based on the Running Deadline **8** in Docker [Part I](http://deadline.thinkboxsoftware.com/feature-blog/2016/12/02/running-deadline-in-containers-part-1) | [Part II](http://deadline.thinkboxsoftware.com/feature-blog/2016/12/9/running-deadline-in-containers-part-2) with the added bonus of encapsulating the entire system, including 2 slaves, via [Docker Compose](https://docs.docker.com/marcompose/overview/). Tested in [Windows](#windows) and Linux.

**Table of contents**

- [Usage](#usage)
- [Running Arbitrary Commands](#running-arbitrary-commands)
- [Interactive Use](#interactive-use)
- [Windows](windows)
- [Deadline 9](#deadline-9)

<br>

### Usage

This project assumes you have obtained the official installers for Deadline Client and Repository, files I didn't manage to find a direct download link for, even though it is free to use for 1-2 clients.

```bash
$ git clone https://github.com/mottosso/docker-deadline.git
```

Now put the installers into the `installers/` directory.

**Example**

```bash
docker-deadline/
  installers/
    DeadlineClient-8.0.17.2-linux-x64-installer.run
    DeadlineRepository-8.0.17.2-linux-x64-installer.run
```

> Note that this project requires version 8 of Deadline, I didn't manage to get 9 working. See below.

Now we can go ahead and install.

```bash
$ cd docker-deadline
$ ./install.sh
```

This will install the Deadline Repository into a dedicated Docker [volume]() called `deadline-volume`. Clients are then handed this volume upon startup.

Finally, the below command launches two vanilla CentOS 7 clients.

```bash
$ docker-compose up
```

Alternatively, run two Maya 2016 clients

```bash
$ docker-compose -f docker-compose-maya.yml up
```

At this point, you'd probably want to launch Deadline Monitor.

```bash
$ ./deadlinemonitor.sh
```

<br>

### Running Arbitrary Commands

The `run.sh` provides a command-line interface over the internals of the client container. It takes the following syntax.

```bash
$ ./run.sh name-of-container name-of-executable
```

**For example**

```bash
$ ./run.sh slave1 ./deadlinelauncher
```

<br>

### Interactive Use

Gain access to the bash-prompt from within the Client container like so.

```bash
$ ./run.sh interactive bash
```

<br>

### Windows

The above assume a Linux environment. In order to run Deadline Monitor on Windows, you need a X11 server running, such as [VcXsrv](https://sourceforge.net/projects/vcxsrv/) or [Xming](https://sourceforge.net/projects/xming/).

With VcXsrv running, running `deadlinemonitor.sh` should work well with default settings. The container is being passed `$HOSTNAME` from your host to represent the name with which to connect to. If this variable isn't set, you can set it your self, either to your local hostname or IP address.

```bat
$ set HOSTNAME=192.168.0.12
```

<br>

### Deadline 9

This project containerises Deadline 8 because of an issue with the client installation under 9.

```bash
Error: An error occurred while trying to set the repository connection settings.
You may have to provide them again when running the client.
```
