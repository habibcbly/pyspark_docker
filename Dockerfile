
FROM ubuntu:latest



ENV PYTHON_VERSION 3



# 0 - Updating OS 
RUN apt update && apt upgrade -y
RUN apt install wget vim nano -y


# 1 - Install Java (jdk,jre)
RUN apt install openjdk-11-jdk-headless -y
RUN apt install openjdk-11-jre-headless -y

# ? - Install SBT (only useful for Scala/Java Spark)
# Skiped


# 2 - Download, Extract and Move Apache Spark
RUN wget https://apache.mediamirrors.org/spark/spark-3.0.1/spark-3.0.1-bin-hadoop2.7.tgz
RUN tar xzvf spark-3.0.1-bin-hadoop2.7.tgz
RUN mv spark-3.0.1-bin-hadoop2.7 spark && mv spark/ /usr/lib/


# 3 - Configure Spark
RUN echo "JAVA_HOME=/lib/jvm/java-11-openjdk-amd64" >> /usr/lib/spark/conf/spark-env.sh
RUN echo "SPARK_WORKER_MEMORY=4g" >> /usr/lib/spark/conf/spark-env.sh

# 4 - Install python, pip and pyspark
RUN apt install python${PYTHON_VERSION} python3-pip -y
RUN pip3 install pyspark 
RUN echo "alias python='python3' \nalias pip='pip3'" >> ~/.bashrc


# 5 - Configure pyspark
RUN echo "export JAVA_HOME=/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
RUN echo "export SPARK_HOME=/usr/lib/spark" >> ~/.bashrc
RUN echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bashrc
RUN echo "export SPARK_HOME=/usr/lib/spark" >> ~/.bashrc
RUN echo "export PYTHON_DIR_PATH=$SPARK_HOME/python3/" >> ~/.bashrc
RUN echo "export PY4J_PATH=$SPARK_HOME/python3/lib/py4j-0.10.9-src.zip" >> ~/.bashrc
RUN echo "export PYTHONPATH=$PYTHON_DIR_PATH:$PY4J_PATH" >> ~/.bashrc

RUN .  ~/.bashrc

