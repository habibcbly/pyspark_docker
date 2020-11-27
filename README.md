# Pyspark Image

Simple pyspark image. Use it as a base for your ML app. It's a virtual environnement with spark(3.0.1), python3 and pyspark already installed.

To use it, build image :

```{bash}
docker build -t pyspark_docker run .
```

After build phase, launch it in the interactive mode

```{bash}
docker run -it pyspark_docker bash
```

When it's fully up and running you can test it with `foo.py` (python script)
```
python foo.py
```
**Result:**
```
+---+-----+
| id|pow_3|
+---+-----+
|  0|    0|
|  1|    1|
|  2|    8|
|  3|   27|
|  4|   64|
|  5|  125|
|  6|  216|
|  7|  343|
|  8|  512|
|  9|  729|
+---+-----+
```

