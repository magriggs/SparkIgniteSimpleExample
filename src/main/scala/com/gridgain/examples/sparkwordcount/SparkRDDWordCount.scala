package com.gridgain.examples.sparkwordcount

import org.apache.ignite.configuration.IgniteConfiguration
import org.apache.ignite.spark.IgniteContext
import org.apache.spark.{SparkConf, SparkContext}

/**
  * Created by mgriggs on 14/11/2016.
  */
object SparkRDDWordCount {
  def main(args: Array[String]) {
    // create the spark context
    val sc = new SparkContext(new SparkConf().setMaster("local").setAppName("Spark Count"))

//
//    // create ignite rdd
//    val resultsIgniteRDD = new IgniteContext[Char, Int](sc, () => new IgniteConfiguration()).fromCache("resultsIgniteRDD")
//    val igniteWordsRDD = new IgniteContext[String, Int](sc, () => new IgniteConfiguration()).fromCache("igniteWordsRDD")

    // set the count threshold
    val threshold = args(1).toInt

    // split each document into words
    val tokenized = sc.textFile(args(0)).flatMap(_.split(" "))

    val wordCounts = tokenized.map((_, 1)).reduceByKey(_ + _);

    val filtered = wordCounts.filter(_._2 >= threshold);

    // count characters
    val charCounts = filtered.flatMap(_._1.toCharArray).map((_, 1)).reduceByKey(_ + _)

    System.out.println(charCounts.collect().mkString(", "))
  }
}
