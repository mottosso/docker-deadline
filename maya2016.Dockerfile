FROM mottosso/maya:2016sp1

MAINTAINER marcus.ottosson@mindbender.com

# Copy over the installer.
RUN mkdir /tmp/thinkboxsetup/
COPY installers/DeadlineClient-8.*-linux-x64-installer.run /tmp/thinkboxsetup/

# Run the installer.
RUN /tmp/thinkboxsetup/DeadlineClient-8.*-linux-x64-installer.run \
    --mode unattended \
    --unattendedmodeui minimal \ 
    --repositorydir /mnt/DeadlineRepository8 \ 
    --noguimode true \ 
    --restartstalled true  && \
    rm -rf /tmp/thinkboxsetup

WORKDIR /opt/Thinkbox/Deadline8/bin/
