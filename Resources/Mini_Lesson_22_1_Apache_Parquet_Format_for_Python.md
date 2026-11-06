# Mini-Lesson 22.1: Apache Parquet Format for Python

## Overview

As datasets continue to grow in size, processing data using traditional file formats such as CSV becomes increasingly inefficient. Reading and writing large CSV files can consume substantial memory and significantly increase processing times.

To address these challenges, the Apache Software Foundation developed **Apache Parquet**, an open-source columnar storage format optimized for big data analytics and high-performance data processing.

Parquet is designed to improve:

- Storage efficiency
- Query performance
- Data compression
- Scalability
- Big data analytics workloads

---

# What is Apache Parquet?

Apache Parquet is a **columnar storage format**.

Unlike traditional row-based storage systems, Parquet stores data by column.

## Traditional Row-Based Storage

```text
Customer_ID | Name  | City
--------------------------------
1           | John  | LA
2           | Sarah | NY
3           | Mike  | TX
```

Storage layout:

```text
Row 1
Row 2
Row 3
```

Every record is stored together.

---

## Columnar Storage (Parquet)

Storage layout:

```text
Customer_ID
-----------
1
2
3

Name
----
John
Sarah
Mike

City
----
LA
NY
TX
```

All values from the same column are stored together.

---

# Why Columnar Storage is Faster

Most analytical queries only need a subset of columns.

Example:

```sql
SELECT City
FROM Customers;
```

### Row-Based Database

Must read:

```text
Customer_ID
Name
City
```

for every row.

---

### Columnar Database

Reads only:

```text
City
```

This results in:

- Less disk I/O
- Faster queries
- Better compression
- Reduced storage costs

---

# Benefits of Apache Parquet

## Faster Analytics

Because only required columns are read.

Example:

```python
df[['City']]
```

Parquet can access only the needed data instead of scanning an entire record.

---

## Better Compression

Similar values stored together compress efficiently.

Example:

```text
CA
CA
CA
CA
CA
```

Compression algorithms perform very well on repeated values.

Benefits:

- Smaller files
- Lower storage costs
- Faster data transfer

---

## Reduced Memory Usage

Parquet can selectively load only required columns.

Example:

```python
df[['col1', 'col2']]
```

instead of loading the entire dataset.

---

## Big Data Friendly

Commonly used with:

- Apache Spark
- DASK
- AWS Glue
- AWS Athena
- Databricks
- Snowflake
- Azure Data Lake

---

# Installing Apache Arrow

Pandas uses the Apache Arrow library to work with Parquet files.

Install:

```bash
pip install pyarrow
```

Verify installation:

```python
import pyarrow

print(pyarrow.__version__)
```

---

# Creating a Sample DataFrame

```python
import pandas as pd

df = pd.DataFrame(
    data={
        'col1': [1, 2],
        'col2': [3, 4]
    }
)

df
```

Output:

| col1 | col2 |
|--------|--------|
| 1 | 3 |
| 2 | 4 |

---

# Writing a Parquet File

Use:

```python
df.to_parquet('df.parquet')
```

After execution:

```text
df.parquet
```

is created in the current working directory.

---

# Checking the File Exists

From Terminal:

```bash
ls
```

Linux/Mac:

```text
df.parquet
```

Windows CMD:

```cmd
dir
```

Expected:

```text
df.parquet
```

---

# Reading a Parquet File

Use:

```python
pd.read_parquet('df.parquet')
```

Example:

```python
import pandas as pd

df = pd.read_parquet('df.parquet')

print(df)
```

Output:

```text
   col1  col2
0     1     3
1     2     4
```

The original DataFrame is reconstructed.

---

# Complete Example

```python
import pandas as pd

df = pd.DataFrame(
    data={
        'col1': [1, 2],
        'col2': [3, 4]
    }
)

df.to_parquet('df.parquet')

parquet_df = pd.read_parquet('df.parquet')

print(parquet_df)
```

---

# When Should You Use Parquet?

### Recommended

✅ Large datasets

✅ Data warehousing

✅ Data lakes

✅ ETL pipelines

✅ Analytics workloads

✅ Cloud storage

✅ Distributed computing

✅ DASK workloads

✅ Spark workloads

---

### Not Ideal

❌ Human-readable files

❌ Manual editing

❌ Small datasets requiring frequent inspection

In these situations:

- CSV
- Excel

may be easier to use.

---

# Parquet vs CSV

| Feature | CSV | Parquet |
|----------|----------|----------|
| Human Readable | Yes | No |
| Compression | No | Yes |
| File Size | Larger | Smaller |
| Read Speed | Slower | Faster |
| Write Speed | Slower | Faster |
| Analytics | Limited | Excellent |
| Memory Efficiency | Lower | Higher |
| Big Data Support | Limited | Excellent |

---

# Key Takeaways

1. Apache Parquet is a columnar storage format.
2. Data is stored by column rather than by row.
3. Columnar storage improves query performance.
4. Parquet files are typically smaller than CSV files.
5. Parquet is commonly used in modern data engineering architectures.
6. Pandas uses the Apache Arrow (`pyarrow`) library to read and write Parquet files.
7. Use:

```python
df.to_parquet()
```

to write data.

8. Use:

```python
pd.read_parquet()
```

to read data.

---

# Personal Notes

### Data Engineering Perspective

Parquet has become the de facto storage format for modern analytics platforms because it combines:

- Efficient compression
- Fast query performance
- Scalable storage
- Cloud compatibility

A typical production pipeline looks like:

```text
CSV
  ↓
Pandas
  ↓
Parquet
  ↓
S3 / Data Lake
  ↓
Athena / Spark / DASK / Databricks
```

For large-scale data engineering projects, Parquet is generally preferred over CSV because it reduces storage costs while significantly improving processing speed.