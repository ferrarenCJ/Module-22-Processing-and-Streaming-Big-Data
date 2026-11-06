# Coding Activity 22.2: Using DASK to Read and Analyze Multiple Files in Parallel

## Overview

In this activity, I practiced using DASK to read multiple CSV files in parallel and perform basic analytical operations on a large dataset. DASK provides an efficient way to process large volumes of data by distributing workloads across partitions and executing operations in parallel.

The activity involved generating multiple CSV files, loading them into a DASK DataFrame using a wildcard pattern, and performing several analytical operations including computing the mean of a column, determining the number of columns, and calculating the total number of rows.

---

# Learning Outcome

**Run parallel operations in DASK.**

---

# Activity Objectives

- Generate multiple CSV files using DASK.
- Read multiple files simultaneously using DASK.
- Use wildcard patterns when loading files.
- Analyze a large dataset with DASK.
- Compute aggregate statistics.
- Determine the size and structure of a dataset.
- Gain experience with parallel file processing.

---

# Environment

## Operating System

```text
Windows
```

## Development Environment

```text
Visual Studio Code
```

## Python Environment

```text
Python Virtual Environment (venv)
```

## Required Libraries

```python
import dask.dataframe as ddf
from dask import delayed
```

---

# Step 1: Download GenerateFilesWithDask.py

## Objective

Create the Activity_22.2 folder and place the provided GenerateFilesWithDask.py file inside it.

## Result

The file was successfully downloaded and saved inside the Activity_22.2 folder.

### Folder Structure

```text
Activity_22.2
│
└── GenerateFilesWithDask.py
```

### Screenshot

```text
Step_1_GenerateFilesWithDask.png
```

---

# Step 2: Generate the Data Files

## Objective

Run the provided script to generate multiple CSV files.

## Command

```cmd
python GenerateFilesWithDask.py
```

## Purpose

The script generates a large time-series dataset and partitions it into multiple CSV files.

### Script Logic

```python
df = dask.datasets.timeseries()

df.to_csv(
    'data/*.csv',
    name_function=name
)
```

## Result

A data folder was created containing multiple CSV files.

### Example Files

```text
2000-01-01.csv
2000-01-02.csv
2000-01-03.csv
...
```

### Screenshot

```text
Step_2_Data_Folder.png
```

---

# Step 3: Create Activity22-2.py

## Objective

Create a new Python file named Activity22-2.py.

## Folder Structure

```text
Activity_22.2
│
├── Activity22-2.py
├── GenerateFilesWithDask.py
└── data
```

### Screenshot

```text
Step_3_Activity22_2_Py.png
```

---

# Step 4: Import DASK Libraries

## Code

```python
import dask.dataframe as ddf
from dask import delay*d
```

## Purpose

These imports p*ovide access to:

- DASK DataFrame*
- Parallel processing functionali*y
- Delayed execution

*## Screenshot

```text
Step_4_DASK*Imports.png
```

---

# Step 5: Re*d Multiple CSV Files Using a Wild*ard

## Code

```python
df = ddf.r*ad_csv("data/2000*.csv")

df.compute()

print(df.head())
```

## Explanation

The wildcard:

```python
2000*.csv
```

allows DASK to load all CSV files that begin with:

```text
2000
```

and*end with:

```text
.csv
```

into * single logical DataFrame*

## First Five Rows

```text
    *        timestamp      name    id *       x         y
0  2000*01-01 00:00:00   Sarah   101*  0.859279  0.786359
1* 2000-01-01 00:00:01 *Hannah   1025  0.388418 -0.443*54
2  2000-01-01 00:00*02  George    926  0.375695 -0*282884
3  2000-01-01 00:00:03     *ay    947 -0.158*07 -*.358797
4  2000-01-01 *0:00:04  Norbert 1031  0.*83657 -0.310872
```

###*Screenshot

```text
Step_5_DataFra*e_Head.png
``*

---

# Step 6: Compute the Mean *f Column x

## Code

```python
mea* = df['x'].mean().compute()

*rint(f'mean: {mean}')
```

## Resu*t

```text
mean: 0.000247275555067*66
```

## Explanation

DASK compu*ed the average*value of the x column across all f*les and all rows.

### Screenshot
*```text
Step_6*Mean_Output.png
```

---

# Step 7* Compute the Number of Columns

##*Code

```python
cols = len(df.colu*ns)

print(f'columns: {cols}')
```*
## Result

```text
columns: 5
```*
## Columns Ident*fied

```text
timestamp
name
id
x
*
```

### Screenshot

```text
Step*7_Columns_Output.png*```

---

# Step 8: Compute the Nu*ber of Rows

## Code

```python
ro*s = len(df.index)

print(f'*ows: {rows}')
```

## Result

```t*xt
rows: 2592000
```

## Explanati*n

DASK combined all CSV files int* one logical DataFrame containing:*
```text
2,592,000 rows
```

This *emonstrates DASK's ability to proc*ss and manage large datasets acros* multiple files efficiently.

### *creenshot

```text
Step_8_Rows_Out*ut.png
```

---

# Final Script

`*`python
import dask.dataframe as d*f
from dask import delayed

df = d*f.read_csv("data/2000*.csv")

df.c*mpute()

print(df.head())

mean = *f['x'].mean().compute()

print(f'm*an: {mean}')

cols = len(df.column*)

print(f'columns: {cols}')

rows*= len(df.index)

print(f'rows: {ro*s}')
```

---

# Results Summary

* Metric | Value |
|----------|----*-----|
| Mean of x | 0.00024727555*067066 |
| Number of Columns | 5 |*| Number of*Rows | 2,592,000 |

---

# Key Con*epts Demonstrated

## Wildcard Fil* Reading

```python
data/2000*.csv*```

allowed multiple files to be *oaded simultaneously.

---

## Par*llel File Processing

DASK process*d multiple CSV files as a single d*taset.

---

## DASK DataFrames

D*SK DataFrames provide functionalit* similar to Pandas while supportin* larger datasets and parallel exec*tion.

---

## Distributed Data An*lysis

The activity demonstrated h*w analytical operations can be per*ormed efficiently across multiple *iles without manually combining th* datasets.

---

# Real-World Appl*cations

The techniques used in th*s activity are common in:

- Data *akes
- ETL pipelines
- Log process*ng systems
- IoT sensor data analy*is
- Financial transaction process*ng
- Utility asset analytics
- Fle*t telemetry analytics

Modern data*engineering platforms such as Apac*e Spark, Databricks, AWS Glue, and*DASK all rely on similar partition*ng and parallel-processing concept*.

---

# Conclusion

In this acti*ity, I used DASK to read multiple *SV files in parallel using a wildc*rd pattern and combine them into a*single DataFrame. After loading th* data, I analyzed the dataset by d*splaying the first five rows, calc*lating the mean of the x column, d*termining the number of columns, a*d computing the total number of ro*s. The final dataset contained 5 c*lumns and 2,592,000 rows. This act*vity demonstrated how DASK simplif*es large-scale file processing and provides an effective solution for parallel data analysis in modern data engineering environments.