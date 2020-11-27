#==================== Setup ===========================
from pyspark.sql import SparkSession

spark  = SparkSession \
    .builder \
    .appName("Test") \
    .config("spark.some.config.option","some-value") \
    .getOrCreate()
#======================================================





if __name__ = "__main__":

    seq10 = spark.range(10)
    seq10.show()
