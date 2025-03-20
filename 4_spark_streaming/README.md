git clone https://github.com/enesavci16/retail_sales_ea.git

cd retail_sales_ea/kafka-spark-entegretion/

chmod +x setup-spark-streaming.sh

./setup-spark-streaming.sh


# upload key 

# set env

export KAFKA_ADDRESS=35.229.169.159
export GCP_GCS_BUCKET="de-bucket-retail_sales"
export GOOGLE_APPLICATION_CREDENTIALS="/home/g02datatalks/de-ea-retail-sales-e02f3013230d.json"

echo $KAFKA_ADDRESS
echo $GCP_GCS_BUCKET
echo $GOOGLE_APPLICATION_CREDENTIALS



wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop3-2.2.5.jar

ls -l gcs-connector-hadoop3-2.2.5.jar

sudo cp ./gcs-connector-hadoop3-2.2.5.jar $SPARK_HOME/jars/

cp ./gcs-connector-hadoop3-2.2.5.jar $SPARK_HOME/jars/





spark-submit \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2 \
  --conf spark.executorEnv.KAFKA_ADDRESS=35.229.169.159 \
  stream_data.py

spark-submit \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.1.2 \
  --jars /home/g02datatalks/gcs-connector-hadoop3-2.2.5.jar \
  stream_data.py


# warning:
if you get broker unvaliable error. export kafka addres in kafka instance.
