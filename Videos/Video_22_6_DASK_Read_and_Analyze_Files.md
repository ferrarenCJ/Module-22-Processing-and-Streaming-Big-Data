# Video 22.6: Using DASK to Read and Analyze Multiple Files in Parallel (05:41)

## Overview

In this video, Dr. Williams demonstrates how DASK can read and analyze multiple files simultaneously using parallel processing. Rather than loading files one at a time, DASK can distribute file-reading operations across multiple partitions and CPU cores, significantly improving performance when working with large datasets.

This capability is particularly valuable in data engineering workloads where data is often stored across hundreds or thousands of files.

---

# Why Read Multiple Files in Parallel?

Consider a workload containing multiple files:

```text
sales_2020.csv
sales_2021.csv
sales_2022.csv
sales_2023.csv
```

Using traditional Pandas:

```text
Read File 1
      ↓
Read File 2
      ↓
Read File 3
      ↓
Read File 4
```

Each file must be loaded sequentially.

---

Using DASK:

```text
Read File 1

Read File 2

Read File 3

Read File 4
```

Multiple files can be processed simultaneously.

Benefits:

- Faster ingestion
- Better CPU utilization
- Increased scalability
- Improved performance for large datasets

---

# Reading Multiple Files with DASK

Import DASK DataFrame:

```python
import dask.dataframe as dd
```

Read all CSV files in a directory:

```python
df = dd.read_csv("data/*.csv")
```

The*wildcard:

```python
*.csv
```

te*ls DASK to read every CSV file in *he directory.

---

# Example*
Directory structure*

```text
data
│
├── sales*2020.csv
├── sales_2021.csv
├──*sales_2022.csv
└── sales_2023.csv
*``

DASK:

```python
df = dd.read_*sv("data/*.csv")
```

automatically combines the files into a single logical DataFrame.

---

# How DASK Handles Multiple Files

DASK does not immediately load all data into memory.

Instead:

```text
File 1
File 2
File 3
File 4
      ↓
Create Partitions
      ↓
Build Task Graph
      ↓
Execute When Needed
```

This process is known as:

```text
Lazy Evaluation
```

---

# Lazy Evaluation

When executing:

```python
df = dd.read_csv("data/*.csv")
```

DASK:

✅ Ident*fies all files

✅ Creates tasks

✅*Builds a graph*
✅ Delays execution

No data is re*d yet.

Execution begins only when*

```*ython
.compute()
```

is called.

*--

# Inspect*ng the Data

Display*DataFrame structure:

```python
df*head()
``*

Example:

```text
   customer*id  amount
0          101  *45.00
1          102   72.50*```

---

Display column informati*n:

```python
df.info()
```

---

*isplay summary statistics:

```pyt*on
*f.describe().compute()
```

---

#*Analyzing Multiple Files

Because *ASK treats multiple*files as a single DataFrame, stand*rd analytical operations can be pe*formed easily.

Example:

```pytho*
df["sales"].sum().compute()
```

*ompute total sales:

```python
tot*l_sales = (
    df["sales"*
    .sum()
    .compute()
)
```

*--

# Grouping*Data

Example:

```python
df.group*y(
    "region"
)["sales"].sum().c*mpute()
```

Output*

```text
Region A*   1200
Region B    145*
Region C    1800
```

D*SK distributes the workload across*partitions.

---

* Parallel Analysis

Without DASK:
*```text
Read File*1
Analyze File 1

Read File 2
Anal*ze File*2

Read File 3
Analyze File 3
```
*With DASK:

```text
Read All Files*     *↓
Partition Data
      ↓
Dis*ribute Work
      ↓
Aggregate Resu*ts
```

The analysis occurs in par*llel.

---

# DASK Task Graph

*hen reading multiple files, DASK c*eates a task graph.

Simplified ex*mple:

```text
File 1 Task*
File 2 Task

File 3 Task

*ile 4 Task
      ↓
Combine Results*```

The graph allows DASK to dete*mine:

- Execution order
- Depende*cies*- Parallel opportunities

---

# V*sualizing the Graph

DASK supports*graph visualization.

Example:

``*python
df.visualize()
```

or

```*ython
result.visualize()
```

Grap* visualization helps developers un*erstand:

- Data flow
- Task sched*ling
- Parallel execution paths

-*-

# Why This Matters for Big Data*
Large datasets are often split in*o many files*

Examples:

```text
Transaction D*ta

Sensor Data

GPS Logs

Custome* Records

Machine*Logs
```

Instead of processing ea*h file individually, DASK can anal*ze them collectively*

Benefits:

✅ Faster execution

✅*Lower memory requirements*
✅ Better scalability

✅ Easier fi*e management

---

# Real-World Da*a Engineering Examples

## Data La*e Processing

```text
S3 Bucket
  *   ↓
Thousands of CSV Files
      *
DASK
      ↓
Analytics*```

---

## IoT Data*
```text
Sensor Files
      ↓
Read*in Parallel
      ↓
Aggregate Meas*rements*```

---

## Fleet Analytics

```t*xt
Vehicle*GPS Files
      ↓
Parallel Process*ng
      ↓
Mileage Analysis
      *
Fuel Analysis
```

---

## Utilit* Data

```text
Inspection*Files

Leak Survey Files

Service *ecords
*       ↓
Parallel Analysis
```

La*ge utility datasets can be process*d much faster using partitioned wo*kloads.

---

# Advantages of DASK*for File Analysis

## Parallel Fil* Reading

Files are processed simu*taneously.

---

## Scalable Archi*ecture

Handles larger datasets th*n Pandas.

---

## Familiar Syntax*
Operations remain similar to Pand*s.

---

## Out-of-Memory Processi*g

Allows workloads larger than av*ilable RAM.

---

# Relationship t* Previous Lessons

This video buil*s upon:

### DASK DataFrames

```p*thon
dd.DataFrame
```

### Delayed*Execution

```python
.compute()
``*

### Task Graphs

```python
.visu*lize()
```

### Parallel Processin*

```text
Multiple operations simu*taneously
```

---

# Key Takeaway*

1. DASK can read multiple files *imultaneously.
2. Wildcards allow*entire groups of files to be loade*.
3. DASK combines multiple files *nto one logical DataFrame.
4. DASK*uses lazy evaluation.
5. `.compute*)` triggers execution.
6. Parallel*file reading improves performance.*7. DASK can perform analytical ope*ations across multiple files.
8. T*sk graphs help visualize data proc*ssing workflows.
9. Reading multip*e files in parallel is a common bi* data processing pattern.
10. DASK*provides a scalable alternative to*Pandas for large datasets.

---

#*Personal Notes

### Data Engineeri*g Perspective

This video demonstr*tes one of the most common real-wo*ld data engineering patterns:

```*ext
Many Files
      ↓
Parallel In*estion
      ↓
Transformations
   *  ↓
Aggregations
      ↓
Analytics*```

In modern environments, raw d*ta is rarely stored as a single fi*e.

Examples include:

- AWS S3 da*a lakes
- Parquet data partitions
* Databricks datasets
- Spark workl*ads
- Log archives

Instead of loa*ing each file individually, DASK a*lows all files to be processed as*a single dataset while taking adva*tage of parallel execution. This i* the same architectural principle *sed by distributed platforms such *s Apache Spark, Databricks, AWS Gl*e, and Snowflake.