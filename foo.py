#==================== Setup ===========================
from pyspark.sql import SparkSession
from pyspark.sql.functions import udf

spark  = SparkSession \
    .builder \
    .appName("foo") \
    .getOrCreate()
#======================================================


def power_3(number):
    """power 3

    Args:
        number (int): power 3

    Returns:
        int
    """
    return number**3
power3_udf = udf(power_3)


if __name__ == "__main__":
    seq10 = spark.range(10)
    seq10.select("*",power3_udf("id").alias("pow_3")).show()
