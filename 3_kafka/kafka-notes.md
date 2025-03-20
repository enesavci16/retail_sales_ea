### Setup Kafka
Connect to your VM compute instance as in [2-terraform-gcp-readme.md]() and clone project in VM
```
git clone https://github.com/dannhh/retail-sales.git
```
Move to folder 3_kafka and install conda, docker and confluent-kafka:
```
chmod +x docker-conda.sh
./docker-conda.sh
after you replace docker-conda.sh with docker-conda-ea.sh # it  is important !!!
```
The role of these component:
- Conda is a package management system used to manage the Python dependencies required to interact with Kafka, such as the kafka-python library.

- Docker is used to create lightweight, isolated environments for running Kafka or other services. Kafka can be run inside a Docker container, which makes it easy to deploy and manage Kafka instances in a variety of environments.

- Confluent Kafka is a distribution of Apache Kafka that includes additional tools and features for managing Kafka clusters such as a web-based UI for managing Kafka clusters, connectors for integrating Kafka with other systems, and additional security features.

Type `exit` to close session, then connect again and start kafka instance:
```
export KAFKA_ADDRESS=<external ip address of kafka-instance vm> 
export KAFKA_ADDRESS=35.201.188.31
docker-compose up
```

##  open other window to ssh kafka instance to send data

### Generate data to Kafka
Generate streaming data for above kafka instance to produce it on kafka broker in partitions using topic 'raw_data`
```
python3 generate_dataset_to_kafka.py
```
if kafka send data health there is no problem :)) You can siwitch to spark section
