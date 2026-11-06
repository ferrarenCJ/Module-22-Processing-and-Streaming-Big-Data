# Video 22.5: Using DASK to Create Multiple Files in Parallel (04:16)

## Overview

In this video, Dr. Williams demonstrates how to use DASK to create multiple files simultaneously using parallel processing. Rather than generating files one at a time, DASK allows independent file creation tasks to execute concurrently across available CPU cores.

This approach improves performance and serves as a practical example of how parallel computing can reduce processing time for repetitive workloads.

---

# Why Create Files in Parallel?

Consider a situation where a program must generate multiple files.

Traditional sequential execution:

```text
Create File 1
     ↓
Create File 2
     ↓
Create File 3
     ↓
Create File 4
```

Total processing time is:

```text
File 1 + File 2 + File 3 + File 4
```

Using DASK:

```text
Create File 1

Create File 2

Create File 3

Create File 4
```

All operations can run simultaneously.

Total processing time becomes approximately:

```text
Longest Individual Task
```

rather than the sum of all tasks.

---

# DASK Delayed Functions

The primary tool used is:

```python
from dask import delayed
```

A function is wrapped with:

```python
@delayed
```

or:

```python
delayed(function_name)
```

to tell DASK:

```text
Do not execute immediately.
Build a task graph instead.
```

Execution occurs later when:

```python
.compute()
```

is called.

---

# Example Workflow

## Step 1: Define a Function

```python
def create_file(i):
    filename = f"file_{i}.txt"

    with open(filename, "w") as f:
        f.write(str(i))

    return filename
```

This function creates a file and writes data to it.

---

## Step 2: Create Delayed Tasks

```python
from dask import delayed

tasks = []

for i in range(10):
    tasks.append(
        delayed(create_file)(i)
    )
```

At this stage:

```text
No files are created.
```

DASK is simply building a task graph.

---

## Step 3: Execute Tasks

```python
from dask import compute

compute(*tasks)
```

Now DASK schedules and executes the tasks in parallel.

Files are generated simultaneously.

---

# Understanding Task Independence

Parallel execution works best when tasks are independent.

Example:

```text
Create file_A.txt

Create file_B.txt

Create file_C.txt
```

Each task can be completed without relying on another task.

Because there are no dependencies, DASK can execute them concurrently.

---

# Task Graph Representation

DASK internally constructs a graph.

Example:

```text
File 1 Task

File 2 Task

File 3 Task

File 4 Task
```

Since the tasks are independent, they appear as separate branches.

---

# Visualizing the Workflow

Use:

```python
task.visualize()
```

or:

```python
result.visualize()
```

to display the graph.

Typical visualization:

```text
Create File 1

Create File 2

Create File 3

Create File 4
```

This confirms that DASK recognizes the tasks as independent and can process them simultaneously.

---

# Why Parallel File Creation Matters

Many data engineering workloads generate large numbers of files.

Examples:

- Daily reports
- CSV exports
- Parquet partitions
- Data lake files
- Intermediate ETL outputs

Creating files sequentially can become a bottleneck.

Parallel execution significantly reduces processing time.

---

# Data Engineering Examples

## ETL Pipelines

```text
Source Data
      ↓
Partition Data
      ↓
Generate 100 CSV Files
      ↓
Load into Data Lake
```

DASK can create multiple output files simultaneously.

---

## Parquet Partitioning

```text
Transactions
      ↓
Partition by Year
      ↓
Partition by Month
      ↓
Write Multiple Parquet Files
```

Each partition can be written in parallel.

---

## Log Processing

```text
Application Logs
      ↓
Split by Date
      ↓
Generate Daily Files
```

Each file write operation can run independently.

---

# Advantages of Using DASK

## Faster Execution

Multiple file operations occur simultaneously.

---

## Better CPU Utilization

Available CPU cores remain active.

---

## Scalability

Performance improves as workloads grow.

---

## Reduced Runtime

Large batch jobs complete more quickly.

---

# Limitations

Parallel execution is not always beneficial.

Potential issues include:

### Disk Contention

Many threads writing simultaneously may compete for disk resources.

---

### Small Workloads

For very small tasks:

```text
DASK overhead > performance benefit
```

Sequential execution may be faster.

---

### File Dependencies

If one file depends on another:

```text
Task A
   ↓
Task B
```

tasks cannot run completely in parallel.

---

# Relationship to Earlier Concepts

This video combines several concepts introduced previously.

### Threads

```text
Multiple execution paths
```

### Parallel Processing

```text
Multiple tasks at the same time
```

### DASK Scheduler

```text
Decides when tasks execute
```

### Task Graphs

```text
Visual representation of execution
```

---

# Key Takeaways

1. DASK can create multiple files in parallel.
2. Independent tasks are ideal candidates for parallel execution.
3. The `delayed()` function builds task graphs.
4. `.compute()` executes all scheduled tasks.
5. Parallel execution reduces total processing time.
6. Graph visualizations help understand task dependencies.
7. File generation is a common data engineering workload that benefits from parallel processing.
8. DASK provides a simple method for leveraging multiple CPU cores.

---

# Personal Notes

### Data Engineering Perspective

This example closely resembles real-world ETL and data lake workflows.

Common pattern:

```text
Raw Data
      ↓
Partition Data
      ↓
Create Multiple Files
      ↓
Store in S3/Data Lake
```

Instead of writing files one at a time:

```text
File 1
File 2
File 3
File 4
```

DASK enables:

```text
File 1    File 2

File 3    File 4
```

to be written simultaneously.

This same concept appears in:

- Apache Spark
- Databricks
- AWS Glue
- Snowflake
- Data Lake pipelines

Understanding how DASK creates files in parallel provides a practical foundation for larger distributed data engineering systems that process and generate thousands of files every day.