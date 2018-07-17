#!/usr/bin/env bash
APP_HOME=$1
suff='.java'
className=$2

JAVA_HOME=/root/software/java/jdk1.8.0_121


CLASSPATH=/root/software/java/jdk1.8.0_121/lib




# JVM_OPT="$JVM_OPT -Xdebug -Xrunjdwp:transport=dt_socket,address=32044,server=y,suspend=n"


JAVA_CMD1=" $JAVA_HOME/bin/javac  $APP_HOME/$className$suff"
$JAVA_CMD1


JAVA_CMD2=" $JAVA_HOME/bin/java -classpath $APP_HOME  $className"
$JAVA_CMD2
