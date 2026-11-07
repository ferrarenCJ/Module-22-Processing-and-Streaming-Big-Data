# Self-Study Knowledge Check 22.1: DASK and Parallel Computing

## Overview

This self-study knowledge check assessed understanding of DASK, parallel computing, distributed computing, task scheduling, and DASK DataFrames. The quiz covered concepts introduced throughout Module 22, including parallel execution, task visualization, distributed processing, DASK schedulers and workers, and large-scale data processing.

---

# Learning Outcome

Identify key concepts of DASK and parallel computing.

---

# Assessment Summary

| Question | Topic | Correct Answer |
|-----------|----------|----------|
| 1 | DASK Fundamentals | DASK allows multiple tasks to run in parallel |
| 2 | Threads | All of the answer options are correct |
| 3 | DASK Parallelization | delayed |
| 4 | DASK DataFrames | dask.datasets.timeseries() |
| 5 | Parallel File Creation | DASK |
| 6 | Importing DASK DataFrames | import dask.dataframe |
| 7 | Distributed Computing | dask scheduler and dask worker |
| 8 | DASK Client | from dask.distributed import Client |
| 9 | Thread Definition | A thread is a single CPU pipeline responsible for a specific task |
| 10 | Levels of Parallel Computing | Bit Level, Instruction Level, Task Level, and SuperWord Level |
| 11 | Task Visualization | a.visualize() |
| 12 | DASK Scheduler | It manages all of the DASK tasks |

---

# Question 1

## Topic

DASK Fundamentals

### Question

Which of the following is correct about DASK?

### Correct Answer

```text
DASK allows multiple tasks to run in parallel.
```

### Explanation

DASK is a parallel computing framework that enables multiple tasks to execute simultaneously across CPU cores or distributed worker nodes.

---

# Question 2

## Topic

Threads

### Question

Which of the following options is correct about threads?

### Correct Answer

```text
All of the answer options are correct.
```

### Explanation

The following statements are all true:

- Cores can swap threads in and out in real time.
- Threads are processed by CPU cores.
- Threads from the same process share memory.

---

# Question 3

## Topic

DASK Parallel Processing

### Question

Which DASK library can be used for parallel computing?

### Correct Answer

```text
delayed
```

### Explanation

The `delayed` functionality enables DASK to build task graphs and execute operations in parallel.

Example:

```python
from dask import delayed
```

---

# Question 4

## Topic

Creating DASK DataFrames

### Question

Which statement can be used to create a DASK DataFrame?

### Correct Answer

```python
dask.datasets.timeseries()
```

### Explanation

This function generates a sample DASK DataFrame containing time-series data and is commonly used for demonstrations and testing.

---

# Question 5

## Topic

Parallel File Creation

### Question

Which library can be used to create many files in parallel?

### Correct Answer

```text
DASK
```

### Explanation

DASK can write multiple partitions simultaneously and create multiple files through parallel execution.

---

# Question 6

## Topic

Importing DASK DataFrames

### Question

Which statement imports DASK DataFrames?

### Correct Answer

```python
import dask.dataframe
```

### Explanation

This imports the DASK DataFrame module, providing DataFrame functionality similar to Pandas while supporting parallel computation.

---

# Question 7

## Topic

Distributed Computing Commands

### Question

Which commands are used for distributed processing?

### Correct Answer

```text
dask scheduler and dask worker
```

### Explanation

Distributed processing requires:

```text
Scheduler
```

to coordinate tasks and:

```text
Workers
```

to execute those tasks.

---

# Question 8

## Topic

DASK Clients

### Question

Which statement imports a DASK client?

### Correct Answer

```python
from dask.distributed import Client
```

### Explanation

The Client object is used to connect an application to a DASK scheduler.

Example:

```python
client = Client("tcp://127.0.0.1:8786")
```

---

# Question 9

## Topic

Threads

### Question

What is a thread?

### Correct Answer

```text
A thread is a single CPU pipeline that is responsible for processing a specific, smaller task in order to solve a larger problem.
```

### Explanation

Threads are the fundamental execution units used by processes to perform work concurrently.

---

# Question 10

## Topic

Levels of Parallel Computing

### Question

Which are the levels of parallel computing?

### Correct Answer

```text
Bit Level
Instruction Level
Task Level
SuperWord Level
```

### Explanation

These four levels represent different approaches for increasing processing efficiency through parallelism.

---

# Question 11

## Topic

Task Visualization

### Question

Which command visualizes a DASK task?

### Correct Answer

```python
a.visualize()
```

### Explanation

DASK can generate task graphs to display task execution and dependencies.

Example:

```python
result.visualize()
```

---

# Question 12

## Topic

DASK Scheduler

### Question

What does the DASK scheduler do?

### Correct Answer

```text
It manages all of the DASK tasks.
```

### Explanation

The scheduler:

- Tracks dependencies
- Assigns tasks to workers
- Coordinates execution
- Monitors worker health
- Collects results

Architecture:

```text
Client
   ↓
Scheduler
   ↓
Workers
```

---

# Key Concepts Reinforced

## DASK

A Python framework for parallel and distributed computing.

---

## DASK DataFrames

A scalable alternative to Pandas that supports partitioned and parallel processing.

---

## Delayed Execution

Operations can be deferred until:

```python
.compute()
```

is executed.

---

## Task Graphs

DASK builds task graphs that define:

- Dependencies
- Execution order
- Parallel opportunities

Visualization:

```python
task.visualize()
```

---

## Distributed Computing

DASK supports a scheduler-worker architecture for executing tasks across multiple machines.

---

## Parallel Computing Levels

```text
Bit Level
Instruction Level
Task Level
SuperWord Level
```

---

# Module 22 Knowledge Check Takeaways

1. DASK enables parallel and distributed computing.
2. Threads allow multiple tasks to execute concurrently.
3. DASK DataFrames provide scalable alternatives to Pandas DataFrames.
4. The `delayed` function supports task graph construction.
5. DASK can create and analyze multiple files in parallel.
6. Task visualization helps understand execution flow.
7. The scheduler coordinates distributed computations.
8. Workers execute tasks assigned by the scheduler.
9. DASK clients connect applications to distributed clusters.
10. The principles learned in DASK closely mirror concepts used in Apache Spark, Databricks, AWS Glue, and modern data engineering platforms.

---

# Conclusion

This knowledge check reviewed the core concepts introduced throughout Module 22. Topics included parallel computing, distributed processing, DASK DataFrames, task scheduling, threads, task graphs, and distributed clusters. Successfully completing the assessment reinforced an understanding of how DASK can be used to perform scalable data processing and how its scheduler-worker architecture supports modern distributed computing environments.