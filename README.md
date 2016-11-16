Simple Spark & Ignite Integration
==============

Two simple Spark applications that demonstrate integration with Apache Ignite.
___

<h3> Prerequisites </h3>
1. Install Apache Ignite
    - https://apacheignite.readme.io/docs/getting-started#installation
2. Install Apache Spark
    - http://spark.apache.org/docs/latest/
3. Grab a data file
    - For example, download biographies.list.gz from ftp://ftp.fu-berlin.de/pub/misc/movies/database/ and extract
4. Start Ignite
    - `YOUR_IGNITE_LOCATION/bin/ignite.sh`
5. Start Spark cluster
    - `YOUR_SPARK_LOCATION/sbin/start-all.sh`
6. Build the application:
    - `sbt package`
7. Run Spark+Ignite 
    - `start.sh`

___

<h2>Scripted Runnable Examples</h2>
<h3>SparkWordCount</h3>
The first example counts the occurrence of each word in a corpus and then counts the
occurrence of each character in the most popular words.

To run Spark+Ignite:
./start.sh com.gridgain.examples.sparkwordcount.SparkWordCount <inputfile>

To run Spark-RDD only for comparison:
./start-rdd.sh com.gridgain.examples.sparkwordcount.SparkWordCount <inputfile>

<br/>

<h3>SparkSQLJoin</h3>
This example demonstrates joining 2 RDDs via the use of DataFrames.
The first RDD is create from a file and the second is an IgniteRDD.

To run Spark+Ignite:
./start.sh com.gridgain.examples.sparkwordcount.SparkSQLJoin <inputfile>

To run Spark-RDD only for comparison:
./start-rdd.sh com.gridgain.examples.sparkwordcount.SparkSQLJoin <inputfile>

___

<h2> IgniteRDD </h3>

To run from a master node in a Spark cluster:

`bin/spark-submit --class com.gridgain.examples.sparkwordcount.SparkWordCount --master local --jars <IGNITE_HOME>/libs/ignite-core-1.5.11.jar,<IGNITE_HOME>/libs/optional/ignite-spark_2.10/ignite-spark_2.10-1.5.11.jar,<IGNITE_HOME>/libs/cache-api-1.0.0.jar, spark-ignite-example-1.0.jar`

This will run the application in a single local process.  If the cluster is running a Spark standalone
cluster manager, you can replace "--master local" with "--master spark://`<master host>`:`<master port>`".

If the cluster is running YARN, you can replace "--master local" with "--master yarn".

___

