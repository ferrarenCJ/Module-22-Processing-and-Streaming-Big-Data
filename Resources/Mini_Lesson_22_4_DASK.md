# Mini-Lesson 22.4: DASK

## Overview

DASK is a parallel computing library for Python that enables users to process large datasets efficiently by distributing work across multiple CPU cores and, if needed, across multiple machines.

DASK extends familiar Python tools such as:

- Pandas
- NumPy
- Scikit-Learn

allowing developers to work with datasets that would otherwise exceed available memory.

One of DASK's primary goals is to make parallel and distributed computing accessible while maintaining a user experience similar to traditional Python data science libraries.

---

# What is DASK?

DASK is a flexible parallel computing framework for Python.

It provides:

- Parallel computing
- Task scheduling
- Distributed computing
- Out-of-core processing
- Large-scale DataFrame operations

DASK enables workloads to be broken into smaller tasks that execute simultaneously.

---

# Why Use DASK?

Traditional libraries such as Pandas and NumPy work exceptionally well for small and medium datasets.

However, they have a major limitation:

```text
Dataset Must Fit Into Memory (RAM)
```

When datasets exceed available memory:

- Programs slow down
- Memory errors occur
- Processing becomes difficult

DASK solves this problem.

---

# Advantages of DASK

## Larger-Than-Memory Processing

DASK can process datasets that exceed available RAM.

Example:

```text
RAM Available: 16 GB

Dataset Size: 150 GB
```

Pandas:

```text
May Fail
```

DASK:

```text
Processes Data In Chunks
```

---

## Parallel Execution

DASK uses multiple CPU cores.

Example:

```text
Core 1 → Task A

Core 2 → Task B

Core 3 → Task C

Core 4 → Task D
```

Benefits:

- Faster processing
- Better CPU utilization

---

## Distributed Computing

DASK can scale beyond a single machine.

Example:

```text
Machine A
Machine B
Machine C
Machine D
```

All machines contribute processing power.

---

## Familiar Syntax

Many DASK commands resemble Pandas commands.

Pandas:

```python
import pandas as pd

df = pd.read_csv("file.csv")
```

DASK:

```python
import dask.dataframe as dd

df = dd.read_csv("file.csv")
```

Minimal learning curve.

---

# DASK Components

DASK provides several collections optimized for different workloads.

| Collection | Purpose |
|------------|----------|
| Dask DataFrame | Pandas-style operations |
| Dask Array | NumPy-style operations |
| Dask Bag | Semi-structured data |
| Dask Delayed | Custom parallel tasks |

---

# DASK as a Task Scheduler

One of DASK's most powerful features is its dynamic task scheduler.

Rather than immediately executing instructions, DASK:

1. Builds a task graph
2. Optimizes the graph
3. Executes tasks efficiently

Example:

```text
Task A
Task B
Task C
```

DASK determines:

```text
Execution Order

CPU Allocation

Task Dependencies
```

Automatically.

---

# Installing DASK

Install DASK with:

```bash
pip install "dask[complete]"
```

Alternative:

```python
%pip install "dask[complete]"
```

Verify installation:

```python
import dask

print(dask.__version__)
```

---

# Working in Google Colab

This module uses Google Colab as the execution environment.

Benefits:

- Cloud-based execution
- No local setup required
- Free compute resources
- Easy notebook sharing

Google Colab:

```text
https://colab.research.google.com
```

---

# Reading a CSV File with DASK

Import DASK DataFrame:

```python
import dask.dataframe as dd
```

Read a CSV file:

```python
df = dd.read_csv(
    "dataset.csv",
    encoding="ISO-8859-1"
)
```

Time execution:

```python
%time df = dd.read_csv(
    "dataset.csv",
    encoding="ISO-8859-1"
)
```

---

# Uploading Data into Colab

```python
from google.colab import files

uploaded = files.upload()
```

This opens a file selection dialog allowing local files to be uploaded into the notebook.

---

# Why DASK Reads Large Files Faster

Instead of loading an entire file into memory:

```text
Entire File
      ↓
Memory
```

DASK:

```text
File
  ↓
Partitions
  ↓
Parallel Processing
```

Benefits:

- Reduced memory pressure
- Faster execution
- Better scalability

---

# DASK Arrays

DASK supports NumPy-style arrays.

Example:

```python
import dask.array as da

x = da.ones((50, 50), chunks=(5, 5))
```

Here:

```python
chunks=(5,5)
```

divides the array into smaller partitions.

---

# Task Visualization

One of DASK's most useful debugging features is task visualization.

Example:

```python
import dask.array as da

x = da.ones((50, 50), chunks=(5, 5))

y = x + x.T

y.visualize(filename="transpose.svg")
```

Visualization shows:

```text
Task Dependencies

Execution Flow

Parallel Operations
```

This helps developers understand how DASK processes workloads.

---

# Running Parallel Tasks with DASK

DASK allows custom functions to run in parallel.

The key tool is:

```python
from dask import delayed
```

---

# The @delayed Decorator

Use:

```python
@delayed
```

to tell DASK:

```text
Do not execute immediately.
Build a task graph.
Execute later.
```

Example:

```python
from dask import delayed
```

```python
@delayed
def add(x,y):
    return x + y
```

---

# Case Study: Numerator and Denominator

Imagine an equation where:

```text
Result =
Numerator
---------
Denominator
```

The numerator and denominator can be calculated independently.

This makes them excellent candidates for parallel execution.

---

## Numerator Function

```python
@delayed
def Numerator(x,y):
    total = 0

    for i in range(1,y+1):
        total += (i * x)

    return total
```

---

## Denominator Function

```python
@delayed
def Denominator(y):

    factorial = 1

    for i in range(y,1,-1):
        factorial *= i

    return factorial
```

---*
## Division Function

```python
d*f Divide(
    numerator,
    denom*nator
):

    return numerator / d*nominator
```

---

# Execute Task*

```python
numerator = delayed(
 *  Numerator
)(1500,10)

denominato* = delayed(
    Denominator
*(10)

result = delayed(
    Divide*)(
    numerator,
    denominator
*

result.compute()
```

---

# Wha**Happens Internally?

DASK creates * task graph:

```text
Numerator Ta*k
        *\
          \
           Divide
  *       /
         /
Denominator Ta*k
```

The numerator and denominat*r are computed at the same time.

*nly after both are completed does*DASK perform the division.

---

#*The .compute() Function

DASK uses*lazy evaluation.

Creating tasks:
*```python
result = delayed(...)
``*

does not execute them.

Executio* begins only when:

```python
resu*t.compute()
```

is called.

Think*of `.compute()` as:

```text
Run E*erything Now
```

---

# Visualizi*g a Task Graph

Use:

```python
re*ult.visualize()
```

This generate* a graph displaying:

- Task relat*onships
- Execution dependencies
-*Parallel branches

Useful for:

- *ebugging
- Optimization
- Understa*ding execution flow

---

# Why DA*K is Powerful

Instead of:

```tex*
Numerator
     ↓
Wait
     ↓
Deno*inator
     ↓
Wait
     ↓
Divide
`*`

DASK performs:

```text
Numerat*r     Denominator
      \       /
*      \     /
        Divide
```

*his reduces total execution time.
*---

# Key Takeaways

1. DASK is a*parallel computing framework for P*thon.
2. DASK can process datasets*larger than memory.
3. DASK suppor*s DataFrames, Arrays, Bags, and De*ayed tasks.
4. DASK uses task grap*s and lazy evaluation.
5. The `@de*ayed` decorator creates tasks that*execute later.
6. `.compute()` tri*gers execution.
7. DASK automatica*ly schedules work across available*CPU cores.
8. Task visualizations *elp understand execution dependenc*es.
9. DASK can operate on a single machine or across distributed systems.
10. DASK is a powerful alternative to Pandas when datasets become very large.

---

# Personal Notes

### Data Engineering Perspective

DASK fills the gap between:

```text
Pandas
      ↓
Too Large
      ↓
Spark
```

for many workloads.

A common workflow:

```text
CSV Files
      ↓
DASK DataFrame
      ↓
Parallel Processing
      ↓
Parquet Output
      ↓
Analytics
```

This makes DASK particularly useful for:

- Data engineering
- ETL development
- Machine learning preprocessing
- Cloud analytics
- Big data experimentation

For data engineers already familiar with Pandas, DASK provides one of the easiest paths toward parallel and distributed computing.