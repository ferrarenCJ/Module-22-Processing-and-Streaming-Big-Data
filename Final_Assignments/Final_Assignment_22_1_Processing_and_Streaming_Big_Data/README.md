# Final Assignment 22.1 (Part 1): Processing and Streaming Big Data

## Overview

This assignment compared the performance of NumPy, Pandas, and DASK when processing arrays and dataframes. The objective was to evaluate how parallel computing, chunking, partitioning, and distributed processing impact performance across different workloads.

The assignment was divided into two major sections:

1. **NumPy vs. DASK Arrays**
2. **Pandas vs. DASK DataFrames**

The work included creating DASK arrays, visualizing task graphs, benchmarking computational performance, loading datasets with DASK, creating large dataframes, and comparing execution times across different libraries.

---

# Learning Outcome

Run parallel operations in DASK.

---

# Assignment Objectives

- Create and analyze DASK arrays.
- Partition large arrays into chunks.
- Visualize DASK task graphs.
- Benchmark NumPy and DASK array computations.
- Load datasets using Pandas and DASK.
- Create large benchmark dataframes.
- Repartition DASK dataframes.
- Compare dataframe performance between Pandas and DASK.
- Understand the performance advantages and tradeoffs of parallel computing.

---

# Environment

## Development Environment

```text
Visual Studio Code
```

## Notebook Environment

```text
Jupyter Notebook
```

## Language

```text
Python
```

---

# Libraries Used

```python
import numpy as np
import pandas as pd
import dask.array as da
import dask.dataframe as ddf
import matplotlib.pyplot as plt
import graphviz
import time
```

---

# Dataset

## Source

```text
salary.csv
```

The dataset contains salary information for data professionals and was used for benchmarking Pandas and DASK dataframe operations.

---

# Part 1: NumPy vs. DASK

## Array Creation

Created a two-dimensional NumPy array with:

```text
Shape: 2000 × 2000
Values: 1–1000
```

### Code

```python
arr = np.random.randint(
    1,
    1001,
    (2000, 2000)
)
```

---

## DASK Array Creation

Converted the NumPy array into a DASK array.

### Chunk Size

```text
250 × 250
```

### Code

```python
darr = da.from_array(
    arr,
    chunks=(250, 250)
)
```

### Result

```text
2000 ÷ 250 = 8 chunks per dimension

8 × 8 = 64 total chunks
```

---

## DASK Task Graph Visualization

Visualized the summation operation using:

```python
res.visualize()
```

The graph demonstrated:

- Chunk-level computations
- Partial aggregations
- Final aggregation stages
- DASK task scheduling

This provided a visual representation of how DASK executes operations in parallel.

---

## NumPy Benchmark

Benchmark executed using:

```python
num_time = numpy_arr_chk()
```

### Result

```text
Wall Time ≈ 925 ms
```

---

## DASK Benchmark

Benchmark executed using:

```python
dask_time = dask_arr_chk()
```

### Result

```text
Wall Time ≈ 825 ms
```

---

## Benchmark Comparison

| Library | Approximate Runtime |
|----------|----------|
| NumPy | 925 ms |
| DASK | 825 ms |

### Observation

For this benchmark run, DASK completed the workload faster than NumPy.

The performance improvement came from DASK's ability to partition work into chunks and execute operations in parallel.

---

# Part 2: Pandas vs. DASK

## Dataset Loading

### Pandas

```python
df_pandas = pd.read_csv('salary.csv')
```

### DASK

```python
df_dask = ddf.read_csv(
    'salary.csv',
    assume_missing=True
)
```

The `assume_missing=True` parameter was required to avoid datatype inference issues during later computations.

---

## Data Loading Benchmark

The following benchmark compared file loading performance:

```python
benchmark(convert_pandas,
          'dataframe pandas')

benchmark(convert_dask,
          'dataframe DASK')
```

### Results

| Library | Runtime |
|----------|----------|
| Pandas | 0.004 sec |
| DASK | 0.009 sec |

### Observation

For a relatively small dataset:

```text
Pandas performed faster.
```

Pandas incurred less overhead because it loaded the data directly into memory.

---

## Large DataFrame Creation

### Large Pandas DataFrame

```python
df_pandas_big = pd.concat(
    [df_pandas] * 1000,
    ignore_index=True
)
```

### Large DASK DataFrame

```python
df_dask_big = ddf.concat(
    [df_dask] * 1000
)
```

---

## Repartitioning

The large DASK dataframe was repartitioned into:

```text
2 partitions
```

### Code

```python
dfn = df_dask_big.repartition(
    npartitions=2
)
```

---

## Aggregation Benchmark

Compared:

```python
Salary.max()
```

between Pandas and DASK.

### Results

| Library | Runtime |
|----------|----------|
| Pandas | 0.081 sec |
| DASK | 1.731 sec |

### Observation

Pandas completed the operation significantly faster than DASK for this workload.

Because the dataset remained manageable in memory, DASK's partition and task scheduling overhead outweighed any potential parallelization benefits.

---

# Screenshot Evidence

## Part1_Q1_Array_Creation.png

Creation of a 2000 × 2000 NumPy array containing random values from 1 to 1000.

---

## Part1_Q2_DASK_Chunks.png

Creation of a DASK array using chunk sizes of 250 × 250, resulting in 64 total chunks across the original array.

---

## Part1_Q6_Task_Graph.png

DASK task graph visualization showing chunk-level sum calculations and aggregation operations used to generate the final result.

---

## Part1_Q8_NumPy_Timing.png

NumPy benchmark execution showing runtime measurements for mean calculations across arrays of varying dimensions.

---

## Part1_Q9_DASK_Timing.png

DASK benchmark execution showing runtime measurements for chunked array computations and parallel processing.

---

## Part2_Q12_Pandas_vs_DASK_Loading_Benchmark.png

Benchmark comparison between Pandas and DASK when loading the salary dataset.

---

## Part2_Q13_Pandas_vs_DASK_BigData_Benchmark.png

Comparison of aggregation performance on large Pandas and DASK dataframes after creating large datasets and repartitioning DASK.

---

# Challenges Encountered

## Graphviz Configuration

DASK task graph visualization initially failed because the Graphviz executable was not accessible from the Jupyter Notebook kernel.

### Resolution

Added the Graphviz executable path:

```python
import os

os.environ["PATH"] += (
    r";...\Graphviz-16.1.0-win64\bin"
)
```

allowing:

```python
res.visualize()
```

to render successfully.

---

## DASK CSV Type Inference

DASK produced datatype inference errors while loading:

```text
salary.csv
```

### Resolution

Modified the import statement:

```python
ddf.read_csv(
    'salary.csv',
    assume_missing=True
)
```

which resolved datatype conflicts during computation.

---

# Performance Summary

## NumPy vs. DASK

| Library | Runtime |
|----------|----------|
| NumPy | 925 ms |
| DASK | 825 ms |

### Faster Library

```text
DASK
```

---

## Pandas vs. DASK Loading

| Library | Runtime |
|----------|----------|
| Pandas | 0.004 sec |
| DASK | 0.009 sec |

### Faster Library

```text
Pandas
```

---

## Large DataFrame Aggregation

| Library | Runtime |
|----------|----------|
| Pandas | 0.081 sec |
| DASK | 1.731 sec |

### Faster Library

```text
Pandas
```

---

# Key Concepts Demonstrated

## Parallel Computing

DASK distributes workloads across multiple chunks and tasks to improve scalability.

---

## Chunking

Large arrays can be divided into smaller sections for independent processing.

Example:

```text
2000 × 2000 Array
        ↓
250 × 250 Chunks
        ↓
64 Chunks
```

---

## Task Graphs

DASK visually represents calculations through dependency graphs.

These graphs show:

- Task execution order
- Dependencies
- Aggregation stages

---

## Partitioning

DASK dataframes can be split into partitions for parallel execution.

Example:

```python
repartition(
    npartitions=2
)
```

---

## Performance Tradeoffs

### NumPy

Best for:

- In-memory arrays
- Low-overhead numerical processing

### Pandas

Best for:

- Small-to-medium datasets
- Fast in-memory dataframe operations

### DASK

Best for:

- Very large datasets
- Distributed systems
- Out-of-core processing
- Parallel computing workloads

---

# Key Takeaways

1. DASK can improve performance through chunking and parallel execution.
2. Task graphs provide visibility into computation dependencies.
3. Small datasets often favor Pandas and NumPy due to lower overhead.
4. DASK introduces scheduling and partition-management overhead.
5. DASK becomes increasingly valuable as data size grows beyond memory limits.
6. Parallel computing is not always faster and depends heavily on workload characteristics.
7. Choosing the correct library requires balancing scalability, memory requirements, and computational complexity.
8. DASK provides a practical framework for large-scale analytics and distributed computing.

---

# Conclusion

This assignment provided practical experience comparing traditional in-memory processing libraries with a parallel computing framework. DASK demonstrated benefits when working with partitioned arrays and parallel execution, while Pandas remained more efficient for smaller in-memory dataframe operations. The assignment reinforced the importance of understanding workload characteristics when selecting analytical tools and highlighted how chunking, partitioning, and distributed execution influence performance in modern data engineering workflows.