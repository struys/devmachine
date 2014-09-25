FROM ubuntu:trusty
MAINTAINER Ken Struys <ken@struys.ca>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y ubuntu-desktop
RUN apt-get install -y gnome-session-flashback
RUN apt-get install -y vnc4server
RUN apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

RUN wget -O /tmp/intellij.tar.gz http://download.jetbrains.com/idea/ideaIC-12.0.4.tar.gz
RUN tar xfz /tmp/intellij.tar.gz
#WORKDIR idea-IC-123.169/bin
#RUN ./idea.sh

RUN apt-get install -y expect

RUN mkdir /.vnc
ADD xstartup /
RUN cp xstartup ~/.vnc


ADD vncpassword /
RUN bash /vncpassword

EXPOSE 5901

CMD "bash"
