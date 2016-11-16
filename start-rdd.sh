export PKGS="org.apache.ignite:ignite-core:1.5.0.final,org.apache.ignite:ignite-spark_2.10:1.5.0.final"

/home/mgriggs/spark/bin/spark-submit --class "com.gridgain.examples.sparkwordcount.SparkRDDWordCount" --master local[4] --packages $PKGS target/scala-2.10/spark-ignite-simple-example_2.10-1.0.jar /home/mgriggs/git/SparkIgniteSimpleExample/data/biographies.list 2

