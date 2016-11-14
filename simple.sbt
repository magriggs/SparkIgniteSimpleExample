name := "Spark Ignite Simple Example"

version := "1.0"

scalaVersion := "2.10.5"

libraryDependencies ++= Seq("org.apache.spark" %% "spark-core" % "1.6.3","org.apache.ignite" % "ignite-core" % "1.5.0.final","org.apache.ignite" %% "ignite-spark" % "1.5.0.final","org.apache.ignite" % "ignite-log4j" % "1.5.0.final","javax.cache" % "cache-api" % "1.0.0")

