# Final Assignment 22.1 (Part 1): Processing and Streaming Big Data

## Overview

This assignment compared the performance of NumPy, Pandas, and DASK when processing arrays and dataframes. The objective was to evaluate how parallel and distributed computing techniques affect execution time and scalability when working with large datasets.

The assignment was divided into two sections:

1. NumPy vs. DASK Arrays
2. Pandas vs. DASK DataFrames

---

# Learning Outcome

Run parallel operations in DASK.

---

# Assignment Summary

## Part 1: NumPy vs. DASK

The first section compared NumPy and DASK when performing calculations on large arrays.

### Activities Performed

- Created a 2000 × 2000 NumPy array.
- Converted the NumPy array into a DASK array.
- Partitioned the DASK array into 250 × 250 chunks.
- Analyzed DASK partitions.
- Computed row-based summations.
- Visualized the DASK task graph.
- Benchmarked mean calculations using NumPy and DASK.

### Key Findings

- The DASK array was divided into 64 chunks.
- DASK created a task graph that distributed work across chunks.
- Task graph visualization demonstrated chunk-level calculations and aggregation operations.
- Benchmark results showed DASK outperforming NumPy for the tested workload.

### Benchmark Results

| Library | Approximate Runtime |
|----------|----------|
| NumPy | 0.901 sec |
| DASK | 0.509 sec |

### Outcome

For this benchmark, DASK completed the workload faster by partitioning the array and processing chunks in parallel.

---

## Part 2: Pandas vs. DASK

The second section compared Pandas and DASK using the salary dataset.

### Activities Performed

- Loaded the dataset using Pandas.
- Loaded the dataset using DASK.
- Benchmarked dataframe loading performance.
- Created large benchmark dataframes.
- Repartitioned a large DASK dataframe into two partitions.
- Compared aggregation performance between Pandas and DASK.

### Key Findings

For the original dataset, Pandas loaded the file faster due to lower overhead.

### Initial Data Load Benchmark

| Library | Approximate Runtime |
|----------|----------|
| Pandas | 0.004 sec |
| DASK | 0.009 sec |

### Large DataFrame Benchmark

A large benchmark dataset was created using repeated copies of the original dataframe.

Operations compared:

```python
Salary.max()
```

### Aggregation Benchmark

| Library | Approximate Runtime |
|----------|----------|
| Pandas | 0.081 sec |
| DASK | 1.731 sec |

### Outcome

For this workload, Pandas significantly outperformed DASK because the dataset remained small enough to fit comfortably in memory and did not benefit substantially from DASK's partitioning and scheduling model.

---

# Technologies Used

## Python

Used for implementing all benchmark operations.

---

## NumPy

Used for:

- Array creation
- Numerical computation
- Mean calculations

---

## Pandas

Used for:

- Dataframe creation
- CSV ingestion
- Aggregation operations

---

## DASK

Used for:

- Parallel computing
- Distributed processing
- Array chunking
- Dataframe partitioning
- Task graph visualization

---

## Graphviz

Used to render DASK task graph visualizations.

---

# Key Concepts Demonstrated

## Chunking

Large arrays were divided into:

```text
250 × 250
```

chunks.

This enabled DASK to schedule operations independently across partitions.

---

## Task Graphs

DASK generated task graphs showing:

- Chunk operations
- Partial aggregations
- Final aggregation tasks

---

## Partitioning

DASK dataframes were partitioned to support scalable processing.

Example:

```python
repartition(npartitions=2)
```

---

## Parallel Processing

DASK demonstrated how operations can be broken into smaller tasks and executed independently before combining results.

---

## Performance Tradeoffs

### NumPy

Advantages:

- Low overhead
- Fast in-memory computation
- Ideal for moderate-sized arrays

---

### Pandas

Advantages:

- Excellent performance on in-memory data
- Simple dataframe operations
- Efficient aggregation functions

---

### DASK

Advantages:

- Parallel execution
- Scalable processing
- Distributed computing support
- Out-of-core data processing

Best suited when:

```text
Datasets exceed memory
```

or

```text
Multiple machines are available
```

---

# Challenges Encountered

## Graphviz PATH Configuration

The DASK visualization initially failed because the Graphviz executable was not available in the Jupyter Notebook kernel environment.

### Resolution

The Graphviz binary directory was added to the notebook PATH before rendering task graphs.

---

## DASK CSV Type Inference

DASK encountered datatype inference issues while reading the salary dataset.

### Resolution

The CSV file was loaded using:

```python
ddf.read_csv(
    'salary.csv',
    assume_missing=True
)
```

which resolved the datatype inconsistencies.

---

# Key Takeaways

1. DASK uses chunking and partitioning to enable parallel computation.
2. Task graphs provide visibility into how computations are executed.
3. DASK can outperform NumPy when workloads benefit from parallel execution.
4. Pandas often performs better than DASK for smaller in-memory datasets.
5. DASK introduces scheduling and partition-management overhead.
6. Parallel computing becomes increasingly valuable as dataset size grows.
7. Choosing the correct tool depends on workload size and processing requirements.
8. DASK is most effective for large-scale and distributed computing workloads.

---

# Conclusion

This assignment provided hands-on experience comparing NumPy, Pandas, and DASK across a variety of workloads. DASK demonstrated advantages during array-based parallel computations, while Pandas performed more efficiently for dataframe operations on relatively small datasets. The results highlighted the tradeoffs between low-overhead in-memory processing and scalable distributed computing, reinforcing the importance of selecting the appropriate library based on data volume, computational complexity, and scalability requirements.