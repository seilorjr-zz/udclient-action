#!/bin/sh -l
echo $1
if [ -n "$JAVA_HOME" ]; then
    # change the dir to the root of the client directory
    SHELL_NAME="$0"
    SHELL_PATH=`dirname "${SHELL_NAME}"`
    
    if [ "." = "$SHELL_PATH" ]
    then
       SHELL_PATH=`pwd`
    fi

    javacmd="$JAVA_HOME/bin/java"
    jarfile="$SHELL_PATH/udclient.jar"
    
    if [ -r "$jarfile" ]; then
        "$javacmd" $JAVA_OPTS -jar "$jarfile" "$0" $1
    else
        echo "Didn't find $jarfile in directory ${SHELL_PATH}"
        exit 1
    fi
else
    echo You must have JAVA_HOME set on your environment to use the uDeploy client.
    exit 1
fi