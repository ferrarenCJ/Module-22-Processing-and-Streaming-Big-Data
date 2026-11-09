# Module 22 Sandbox

## Overview

The Sandbox folder contains experimental code, practice exercises, troubleshooting examples, and supplemental testing performed while working through Module 22. This area serves as a safe workspace for exploring concepts without affecting assignment deliverables.

The Sandbox was used to test DASK functionality, benchmark performance, validate Graphviz configurations, troubleshoot dataframe issues, and experiment with socket-based communication.

---

# Purpose

The Sandbox provides an environment for:

- Testing code snippets
- Exploring new concepts
- Troubleshooting errors
- Validating assumptions
- Measuring performance
- Experimenting before updating assignment files

---

# Topics Explored

## DASK Arrays

Experiments included:

- Array creation
- Chunk sizing
- Partition management
- Mean calculations
- Summation operations

Example:

```python
import dask.array as da

darr = da.from_array(
    arr,
    chunks=(250, 250)
)
```

---

## DASK DataFrames

Experiments included:

- Reading CSV files
- Dataframe partitioning
- Repartitioning
- Performance benchmarking
- Dtype troubleshooting

Example:

```python
import dask.dataframe as ddf

df = ddf.read_csv(
    "salary.csv",
    assume_missing=True
)
```

---

## Graphviz Testing

Used to validate:

- Graphviz installation
- PATH configuration
- DASK task graph visualization

Example:

```python
result.visualize()
```

---

## Performance Benchmarks

Compared:

- NumPy
- Pandas
- DASK

Areas tested:

- Array operations
- Dataframe loading
- Aggregation performance
- Computation times

---

## Socket Programming

Experiments included:

- Server configuration
- Client configuration
- Port testing
- Packet transmission
- Message formatting

Example:

```python
import socket
```

---

# Troubleshooting Activities

## Graphviz Path Issues

Validated:

```python
import shutil
print(shutil.which("dot"))
```

Used to ensure task graph visualizations could be generated successfully.

---

## DASK CSV Type Inference

Resolved dataframe loading issues using:

```python
ddf.read_csv(
    "salary.csv",
    assume_missing=True
)
```

---

## Client-Server Communication

Verified:

- Port configuration
- Socket connections
- Message transmission
- Header formatting
- Packet reconstruction

---

# Key Concepts Reinforced

## Chunking

Breaking large datasets into smaller pieces for processing.

---

## Partitioning

Dividing data into logical segments for distributed computation.

---

## Parallel Processing

Executing multiple tasks simultaneously.

---

## Task Graphs

Visualizing execution dependencies and computational workflows.

---

## Streaming Data

Transmitting messages continuously between connected applications.

---

## Message Framing

Structuring packets using:

```text
Header + Payload
```

to support reliable communication.

---

# Common Test Files

Examples may include:

```text
dask_array_tests.py
dask_dataframe_tests.py
benchmark_tests.py
graphviz_tests.py
socket_tests.py
```

The exact files may vary based on experimentation performed during the module.

---

# Real-World Relevance

The concepts explored in the Sandbox are commonly used in:

- Apache Spark
- Databricks
- AWS Glue
- Apache Kafka
- AWS Kinesis
- Azure Event Hubs
- Fleet telemetry systems
- Real-time monitoring platforms
- Distributed analytics environments

---

# Key Takeaways

1. Sandbox environments provide a safe place to experiment and learn.
2. Testing concepts independently improves understanding before assignment implementation.
3. DASK benefits from hands-on experimentation with chunking and partitioning.
4. Graphviz visualizations help explain distributed computations.
5. Socket programming concepts become easier to understand through practical testing.
6. Troubleshooting skills are an important part of data engineering workflows.

---

# Conclusion

The Module 22 Sandbox served as a practical experimentation area for testing DASK, Graphviz, benchmarking techniques, and socket programming concepts. Using the Sandbox helped validate configurations, troubleshoot issues, and gain a deeper understanding of parallel computing and real-time streaming technologies before applying them to coding activities and final assignments.
