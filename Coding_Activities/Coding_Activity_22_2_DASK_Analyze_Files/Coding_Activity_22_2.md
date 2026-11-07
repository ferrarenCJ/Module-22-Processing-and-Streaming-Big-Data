# Coding Activity 22.2: Using DASK to Read and Analyze Multiple Files in Parallel

## Overview

This coding activity focused on using DASK to read and analyze multiple CSV files in parallel. The activity simulated a real-world data engineering scenario where data is distributed across many files and must be processed efficiently. Using DASK, multiple CSV files were loaded into a single logical DataFrame and analyzed using parallel processing techniques.

---

# Learning Outcome

Run parallel operations in DASK.

---

# Activity Summary

The activity consisted of four major components:

### Generate Multiple Files

A DASK script was used to generate a collection of CSV files representing a large time-series dataset.

### Read Multiple Files

DASK loaded all CSV files simultaneously using a wildcard pattern.

### Perform Data Analysis

Several analytical operations were executed including:

- Displaying the first five rows
- Computing the mean of column `x`
- Counting the number of columns
- Counting the number of rows

### Validate Results

The output was reviewed to verify the structure and size of the dataset.

---

# Technologies Used

## Python

Used for implementing the data processing workflow.

## DASK

Used for:

- Reading multiple files
- Parallel processing
- Distributed-style DataFrame operations
- Large dataset analytics

## Visual Studio Code

Used as the development environment.

---

# Files Used

## Input Files

Generated automatically using:

```text
GenerateFilesWithDask.py
```

Resulting data files:

```text
2000-01-01.csv
2000-01-02.csv
2000-01-03.csv
...
2000-01-30.csv
```

## Analysis Script

```text
Activity22-2.py
```

---

# Key Code

## Read All CSV Files

```python
df = ddf.read_csv("data/2000*.csv")
```

## Display First Five Rows

```python
print(df.head())
```

## Compute Mean

```python
mean = df['x'].mean().compute()
```

## Count Columns

```python
cols = len(df.columns)
```

## Count Rows

```python
rows = len(df.index)
```

---

# Results

| Metric | Result |
|----------|----------|
| Mean of x | 0.000247275555067066 |
| Columns | 5 |
| Rows | 2,592,000 |

---

# Key Concepts Demonstrated

## Parallel File Processing

Multiple CSV files were loaded and analyzed as a single dataset using DASK.

## Wildcard File Reading

The wildcard pattern:

```python
data/2000*.csv
```

allowed all matching files to be loaded automatically.

## DASK DataFrames

Multiple physical files were represented as one logical DataFrame.

## Lazy Evaluation

DASK delayed execution until calculations were requested using:

```python
.compute()
```

## Large Dataset Analysis

The activity successfully processed:

```text
2,592,000 rows
```

across multiple files.

---

# Real-World Applications

The techniques demonstrated in this activity are commonly used in:

- Data Lakes
- ETL Pipelines
- Log Processing
- IoT Sensor Analytics
- Fleet Telemetry Platforms
- Utility Asset Analytics
- Apache Spark Workloads
- Databricks Pipelines
- AWS Glue Jobs

---

# Key Takeaways

1. DASK can efficiently read multiple files in parallel.
2. Wildcard patterns simplify large-scale file ingestion.
3. DASK DataFrames provide a scalable alternative to Pandas.
4. Parallel processing improves performance when working with many files.
5. Datasets containing millions of rows can be analyzed efficiently using DASK.
6. The same concepts are used in modern data engineering platforms such as Spark, Databricks, and AWS Glue.

---

# Conclusion

In this activity, DASK was used to read and analyze multiple CSV files in parallel. The files were combined into a single DASK DataFrame using a wildcard file pattern and analyzed through several computations. The final dataset contained 5 columns and 2,592,000 rows. This activity demonstrated how DASK simplifies large-scale file ingestion and analysis while providing a practical introduction to parallel data processing techniques used throughout modern data engineering platforms.