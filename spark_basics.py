#####################
### Spark Context
#####################
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("MyReport") \
    .getOrCreate()


#####################
### Dataframe
#####################
# create dataframe
data = [("Alice", 34), ("Bob", 45), ("Charlie", 38)]
df = spark.createDataFrame(data, ["Name", "Age"])
df.show()

# read parquet file from s3
df = spark.read.parquet("s3a://bucket-name/path/to/your/parquet-file")

# read from CSV
df = spark.read.csv("path_to_csv_file.csv", header=True, inferSchema=True)

# select
df.select("Name", "Age").show()

# group by
df.groupBy("Name").agg({"Age": "avg"}).show()

# make a column
import pyspark.sql.functions as F
df.withColumn("Age", F.lit(25))

# math functions
df.agg(F.avg("score")
df.agg(F.sum("amount")

# string functions
df.select(F.lower(df.first_name), F.upper(df.last_name))

# date
df.select(F.date_format("time_created", "yyyy-MM-dd"))
df.withColumn("time_created", F.to_date(df.date_str, "yyyy-MM-dd"))

# convert one row into multiple rows
df.select(explode(df.names).alias("name"))

# convert a column into array type column
df.withColumn("names", split(df.name, ","))


#####################
### Join
#####################
df1 = spark.createDataFrame([(1, "Alice"), (2, "Bob")], ["ID", "Name"])
df2 = spark.createDataFrame([(1, "Engineering"), (2, "Sales")], ["ID", "Department"])
df1.join(df2, "ID", "inner").show()


#####################
### Output
#####################
# write to CSV
df.write.csv("output_path.csv", header=True)

# write to parquet
df.write.parquet("output_path.parquet")



