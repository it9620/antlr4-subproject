FROM ubuntu:24.04

# Install Java and curl
RUN apt-get update && apt-get install -y \
    curl \
    openjdk-17-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Copy jar file to the container
# You can change the version of the antlr jar file:
RUN curl -fL -o /usr/local/lib/antlr-4.13.2-complete.jar http://www.antlr.org/download/antlr-4.13.2-complete.jar

# Set the CLASSPATH environment variable
ENV CLASSPATH=".:/usr/local/lib/antlr-4.13.2-complete.jar:$CLASSPATH"

COPY ./Syntax.g4 /root/

# You can change the language to generate the parser from C# to other one
# (list of supported languages see on the official site):
ENTRYPOINT [ "java", "-jar", "/usr/local/lib/antlr-4.13.2-complete.jar", "-o", "/root/generated", "-listener", "-visitor", "-Dlanguage=CSharp", "/root/Syntax.g4"]

# For debuging: Comment entrypoint above and use the entrypoint below to run the container in interactive mode
#ENTRYPOINT [ "/bin/bash" ]
