export PKGS="org.apache.ignite:ignite-core:1.5.0.final,org.apache.ignite:ignite-spark_2.10:1.5.0.final"

$SPARK_HOME/bin/spark-submit --class "com.gridgain.examples.sparkwordcount.SparkWordCount" --master local[4] --packages $PKGS -v target/scala-2.10/spark-ignite-simple-example_2.10-1.0.jar /home/mgriggs/git/SparkIgniteSimpleExample/data/alice.txt 10

