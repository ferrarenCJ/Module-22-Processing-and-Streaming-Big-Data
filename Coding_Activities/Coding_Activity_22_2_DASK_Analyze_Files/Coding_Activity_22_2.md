# Coding Activity 22.2: Using DASK to Read and Analyze Multiple Files in Parallel

## Overview

This coding activity focused on using DASK to read and analyze multiple CSV files in parallel. Rather than loading individual files sequentially, DASK combines multiple files into a single logical DataFrame and processes them using parallel computing techniques.

The activity simulated a common data engineering scenario in which data is distributed across many files and must be analyzed efficiently. Using DASK, I generated a collection of CSV files, loaded them using a wildcard pattern, and performed basic analytical operations on the resulting dataset.

---

# Learning Outcome

**Run parallel operations in DASK.**

---

# Objectives

- Generate multiple CSV files using DASK.
- Read multiple files using a wildcard pattern.
- Load all files into a single DASK DataFrame.
- Analyze the dataset using DASK.
- Compute summary statistics.
- Determine dataset dimensions.
- Gain practical experience with parallel file processing.

---

# Activity Summary

### Part 1: Generate Files

A DASK script was used to generate a collection of CSV files inside a data directory.

### Part 2: Read Files

A wildcard pattern was used to read all CSV files beginning with:

```text
2000
```

using:

```python
df = ddf.read_csv("data/2000*.csv")
```

### Part 3: Analyze Da*a

Basic analytics were performed:*
- Display first five rows
- Calcu*ate mean of column x
- Determine n*mber of columns
- Determine number*of rows

---

# DASK Libraries Use*

```python
import dask.dataframe *s ddf
from dask import delayed
```*
These libraries provide:

- DASK *ataFrames
- Parallel processing ca*abilities
- Lazy evaluation
- Dist*ibuted execution support

---

# R*ading Multiple Files

The dataset *as read using:

```python
df = ddf.read_csv("data/2000*.csv")
```

The wildcard:

```text
*
```

allowed DASK to automatically load every file matching:

```text
2000*.csv
```

This eliminated the need*to manually load each file one at * time.

---

# Displaying the Data*
The first few rows were displayed*using:

```python
print(df.head())*```

Sample output:

```text
     *       timestamp      name    id  *      x         y
0  2000-01-01 00*00:00   Sarah   1016  0.859279  0*786359
1  2000-01-01 00*00:01  Hannah   1025  0.388*18 -0.443454
2  2000-01-*1 00:00:02  George    926  0*375695 -0.282884
3  2000-*1-01 00:00:03     Ray    947 -*.158507 -0.358797
4  2000*01-01 00:00:04  Norbert 103*  0.283657 -0.310872
```

*--

# Computing the Mean

The*mean value of column x was compute* using:

```python
*ean = df['x'].mean().compute()

pr*nt(f'm*an: {mean}')
```

Result:

```text*mean* 0.000247275555067066
```

DASK pr*cessed the calculation across all *oaded files and combined the resul*s.

---

# Computing the Number of*Columns

The total number of colum*s was determined using:

```python*cols = len(df.columns)

print(f'co*umns: {cols}')
```

Result:

```te*t
columns: 5
```

Columns identifi*d:

```text
timestamp
name
id
x
y
*``

---

# Computing the Number of*Rows

The total number of rows was*determined using:

```python
rows * len(df.index)

print(f'rows: {row*}')
```

Result:

```text
rows: 25*2000
```

This demonstrates DASK's*ability to efficiently manage data*ets containing millions of records*spread across many files.

---

# *inal Script

```python
import dask*dataframe as ddf
from dask import delayed

df = ddf.read_csv("data/2000*.csv")

df.compute()

print(df.head())

mean = df['x'].mean().compute()

print(f'mean: {mean}')

cols = len(df.columns)

print(f'columns: {cols}')

rows = len(df.index)

print(f'rows: {rows}')
```

---

# Results

| Metric | Result |
|----------|----------|
| Mean of x | 0.000247275555067066 |
| Number of Columns | 5 |
| Number of Rows | 2,592,000 |

---

# Key Concepts Demonstrated

## Wildcard File Loading

```python
ddf.read_csv("data/2000*.csv")
```

loaded all matching fi*es automatically.

---

## Paralle* File Processing

DASK processed m*ltiple files simultaneously rather*than sequentially.

---

## DASK D*taFrames

Multiple files were trea*ed as a single logical DataFrame.
*---

## Lazy Evaluation

Operation* were delayed until:

```python
.c*mpute()
```

was called.

---

## *arge-Scale Analytics

The activity*demonstrated how DASK can efficien*ly analyze millions of records whi*e maintaining a workflow similar t* Pandas.

---

# Real-World Applic*tions

These techniques are common*y used in:

- Apache Spark workloa*s
- Databricks pipelines
- AWS Glu* jobs
- Data lake analytics
- Log *rocessing
- IoT sensor analytics
-*Fleet telemetry processing
- Utili*y asset analytics
- ETL pipelines
*---

# Key Takeaways

1. DASK can *ead multiple files simultaneously *sing wildcards.
2. DASK DataFrames*behave similarly to Pandas DataFra*es.
3. Parallel processing improve* efficiency when working with many*files.
4. The `.compute()` method *xecutes delayed operations.
5. DAS* can efficiently process datasets *ontaining millions of rows.
6. Rea*ing and analyzing multiple files i* a common data engineering use cas*.

---

# Conclusion

In this acti*ity, I used DASK to read and analy*e multiple CSV files in parallel. *he files were loaded into a single*DASK DataFrame using a wildcard pa*tern, allowing the dataset to be a*alyzed as a unified collection. I *uccessfully displayed the first fi*e rows, calculated the mean of the*x column, determined the number of*columns, and computed the total nu*ber of rows. The final dataset con*ained 5 columns and 2,592,000 rows* This activity demonstrated the va*ue of DASK for large-scale file pr*cessing and highlighted how parall*l computing can improve efficiency*when working with large datasets spread across multiple files.