FROM mottosso/maya:2018.7

MAINTAINER marcus.ottosson@mindbender.com

# Install dependencies for Deadline
RUN yum -y install \
    redhat-lsb \
    libX11 \
    libXext \
    mesa-libGL

# Copy over the installer.
RUN mkdir /tmp/thinkboxsetup/
COPY installers/DeadlineClient-10.*-linux-x64-installer.run /tmp/thinkboxsetup/

# Run the installer.
RUN /tmp/thinkboxsetup/DeadlineClient-10.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui minimal \ 
    --repositorydir /mnt/DeadlineRepository10 \ 
    --noguimode true \ 
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup

WORKDIR /opt/Thinkbox/Deadline10/bin/
