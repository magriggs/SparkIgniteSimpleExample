if [ $# -ge 3 ]; then
	echo "$0: usage: start <classname> <input file>"
	exit 0
fi

class="com.gridgain.examples.sparkwordcount.SparkWordCount"
input="biographies.list"

if [ $# -eq 2 ]; then
	class=$1
	input=$2
	echo class: $class
	echo input: $input
fi

if [ $# -eq 1 ]; then
	class=$1
fi

export SPARK_HOME=/home/mgriggs/spark

export PKGS="org.apache.ignite:ignite-core:1.5.0.final,org.apache.ignite:ignite-spark_2.10:1.5.0.final"

#$SPARK_HOME/bin/spark-submit --class "com.gridgain.examples.sparkwordcount.SparkWordCount" --mas$

$SPARK_HOME/bin/spark-submit --class $class --master local[4] --packages $PKGS target/scala-2.10/spark-ignite-simple-example_2.10-1.0.jar $input 2

