#!/bin/bash

echo "Downloading Java..."
cd ~
mkdir -p spark
cd spark
wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
tar xzf openjdk-11.0.2_linux-x64_bin.tar.gz

echo "Exporting Java Path..."
echo '' >> ~/.bashrc
echo 'export JAVA_HOME="${HOME}/spark/jdk-11.0.2"' >> ~/.bashrc
echo 'export PATH="${JAVA_HOME}/bin:${PATH}"' >> ~/.bashrc

# Source immediately to use in current session
source ~/.bashrc

echo "Installed Java version is..."
java -version  # Changed from --version to -version

rm openjdk-11.0.2_linux-x64_bin.tar.gz

echo "Downloading Spark..."
wget https://archive.apache.org/dist/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz

echo "Extracting Spark..."
tar xzf spark-3.5.1-bin-hadoop3.tgz
rm spark-3.5.1-bin-hadoop3.tgz

echo "Exporting Spark Home..."
echo '' >> ~/.bashrc
echo 'export SPARK_HOME="${HOME}/spark/spark-3.5.1-bin-hadoop3"' >> ~/.bashrc
echo 'export PATH="${SPARK_HOME}/bin:${PATH}"' >> ~/.bashrc

# Source again for Spark variables
source ~/.bashrc

echo "Setting up Pyspark..."
py4j_path=$(ls ${SPARK_HOME}/python/lib/py4j-*.zip)
py4j_file=$(basename "$py4j_path")

echo "py4j version is $py4j_file"

echo '' >> ~/.bashrc
echo 'export PYTHONPATH="${SPARK_HOME}/python/:$PYTHONPATH"' >> ~/.bashrc
echo "export PYTHONPATH=\"${SPARK_HOME}/python/lib/${py4j_file}:\$PYTHONPATH\"" >> ~/.bashrc
echo 'export YARN_CONF_DIR="$HADOOP_HOME/etc/hadoop"' >> ~/.bashrc
echo 'export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"' >> ~/.bashrc

echo "Installation complete! Run 'source ~/.bashrc' or restart your shell."