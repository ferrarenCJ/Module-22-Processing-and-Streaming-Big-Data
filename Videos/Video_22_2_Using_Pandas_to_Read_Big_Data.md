# Video 22.2: Using Pandas to Read Big Data

## Overview

In this section, you are introduced to techniques for processing and managing large datasets using the **pandas** library. You will also explore two alternative file formats specifically designed for handling big data workloads:

- Apache Parquet
- Apache Feather

These formats are commonly used in modern data engineering environments because they offer significant performance advantages over traditional CSV files.

The goal of this section is to understand how these formats can improve data storage, reading speed, and analytical workflows when working with large datasets.

---

# Video 22.2: Using Pandas to Read Big Data (02:50)

In this video, Dr. Williams demonstrates how to:

1. Read a large CSV file using pandas.
2. Load the data into a DataFrame.
3. Export the data to the Apache Parquet format.
4. Export the data to the Apache Feather format.
5. Compare alternative storage formats for big data processing.

---

# Why CSV Files Become Challenging

CSV files are simple and widely supported, but they become inefficient as datasets grow.

### Common Challenges

- Large storage requirements
- Slower read times
- Slower write times
- No built-in compression
- Repeated parsing of text values

Example:

```python
import pandas as pd

df = pd.read_csv("large_file.csv")
```

For small datasets this works well, but for millions of records, loading times and memory consumption can increase significantly.

---

# Using Pandas to Read Big Data

### Read a CSV File

```python
import pandas as pd

df = pd.read_csv("large_data.csv")
```

This loads the data into a pandas DataFrame for analysis and transformation.

Common operations:

```python
df.head()

df.info()

df.describe()
```

---

# Apache Parquet Format

Parquet is a columnar storage format designed for analytics and big data applications.

### Write Data to Parquet

```python
df.to_parquet("large_data.parquet")
```

### Read Data from Parquet

```python
df = pd.read_parquet("large_data.parquet")
```

### Advantages

- Columnar storage
- Better compression
- Reduced file sizes
- Faster analytical queries
- Widely used in data lakes

### Common Tools

- Apache Spark
- DASK
- AWS Athena
- AWS Glue
- Databricks
- Azure Synapse

---

# Apache Feather Format

Feather is a lightweight binary format optimized for fast read and write operations.

### Write Data to Feather

```python
df.to_feather("large_data.feather")
```

### Read Data from Feather

```python
df = pd.read_feather("large_data.feather")
```

### Advantages

- Extremely fast read speed
- Extremely fast write speed
- Simple storage format
- Excellent for local analytics workflows

### Common Uses

- Python-to-Python data exchange
- Data science experimentation
- Temporary storage
- Rapid prototyping

---

# Parquet vs Feather

| Feature | Parquet | Feather |
|----------|----------|----------|
| Storage Format | Columnar | Binary Columnar |
| Compression | Excellent | Limited |
| Read Speed | Fast | Very Fast |
| Write Speed | Fast | Very Fast |
| File Size | Smaller | Larger |
| Analytics Workloads | Excellent | Good |
| Data Lakes | Excellent | Limited |
| Local Development | Good | Excellent |

---

# Choosing the Right Format

### Use Parquet When

- Working with big data
- Building data lakes
- Running analytics workloads
- Using Spark or DASK
- Storing data long-term

Examples:

- AWS Athena
- Databricks
- Azure Data Lake
- Large ETL pipelines

---

### Use Feather When

- Prioritizing speed
- Sharing data between Python processes
- Developing locally
- Rapidly iterating on analytics

Examples:

- Jupyter notebooks
- Prototyping
- Data science experimentation

---

# Example Workflow

### Step 1: Load CSV

```python
import pandas as pd

df = pd.read_csv("customer_data.csv")
```

### Step 2: Save to Parquet

```python
df.to_parquet("customer_data.parquet")
```

### Step 3: Save to Feather

```python
df.to_feather("customer_data.feather")
```

### Step 4: Reload Data

```python
parquet_df = pd.read_parquet("customer_data.parquet")

feather_df = pd.read_feather("customer_data.feather")
```

---

# Key Takeaways

### CSV

✅ Universal compatibility

❌ Larger file sizes

❌ Slower processing

---

### Parquet

✅ Compressed

✅ Smaller files

✅ Analytics optimized

✅ Data lake friendly

✅ Preferred for production data engineering

---

### Feather

✅ Fastest read/write speed

✅ Simple format

✅ Excellent for development workflows

❌ Less suitable for large-scale analytics ecosystems

---

# Personal Notes

### Data Engineering Perspective

This video introduces a common optimization pattern used in modern data platforms:

```text
Raw CSV
     ↓
Pandas
     ↓
Parquet / Feather
     ↓
Analytics & Processing
```

Most modern cloud architectures convert raw CSV files into **Parquet** because:

- Storage costs decrease
- Query performance improves
- Data can be processed more efficiently by distributed systems

Tools such as AWS Glue, Athena, Spark, Databricks, and DASK frequently use Parquet as a preferred storage format for large-scale analytics.

For smaller development and machine learning workflows, Feather is often chosen because of its exceptional read and write performance.