# Video 22.4: Introduction to DASK and Running Parallel Operations (09:28)

## Overview

In this video, Dr. Williams introduces **DASK**, a Python library for parallel and distributed computing, and demonstrates how to use DASK to execute tasks simultaneously. The video also introduces **Graphviz**, a visualization tool that can display DASK task graphs and show how computations are executed in parallel.

The primary focus is understanding how DASK manages tasks, builds execution graphs, and schedules work across multiple CPU cores to improve processing efficiency.

---

# What is DASK?

DASK is a Python framework designed to:

- Parallelize computations
- Process large datasets
- Scale data processing across CPU cores
- Distribute workloads across multiple machines
- Work with datasets larger than memory

DASK extends familiar Python tools such as:

- Pandas
- NumPy
- Scikit-Learn

while adding parallel computing capabilities.

---

# Why DASK Matters

Traditional Python libraries generally execute instructions sequentially.

Example:

```text
Task 1
   ↓
Task 2
   ↓
Task 3
   ↓
Task 4
```

DASK allows independent tasks to execute simultaneously.

Example:

```text
Task 1      Task 2

Task 3      Task 4
```

Benefits:

✅ Faster execution

✅ Better CPU utilization

✅ Improved scalability

✅ Ability to process larger datasets

---

# DASK Task Graphs

One of DASK's most powerful features is its use of **task graphs**.

A task graph is a visual representation of:

- Tasks
- Dependencies
- Execution order

Instead of immediately executing instructions, DASK first constructs a graph describing the workload.

Example:

```text
Task A
    \
     \
      Result
     /
    /
Task B
```

This graph allows DASK to determine which tasks can run simultaneously.

---

# Understanding Lazy Evaluation

Unlike Pandas, DASK does not immediately execute commands.

Example:

```python
result = delayed(add)(5, 10)
```

At this point:

```text
No computation occurs
```

DASK simply builds the task graph.

Execution begins only after:

```python
result.compute()
```

is called.

This approach is called **lazy evaluation**.

---

# Installing Graphviz

To visualize DASK task graphs, Graphviz must be installed.

Graphviz allows DASK to generate diagrams showing:

- Task dependencies
- Parallel branches
- Execution flow

Typical installation:

```bash
pip install graphviz
```

Graphviz executable:

```text
dot.exe
```

must also be installed and accessible through the system PATH.

---

# Why Graphviz is Useful

Graphviz provides visibility into how DASK executes work.

Without visualization:

```text
Code
   ↓
Result
```

With visualization:

```text
Code
   ↓
Task Graph
   ↓
Execution Plan
   ↓
Result
```

This makes:

- Debugging easier
- Optimization easier
- Learning easier

---

# Example: Simple Delayed Task

Import delayed:

```python
from dask import delayed
```

Create a function:

```python
@delayed
def square(x):
    return x * x
```

Build the task:

```python
result = square(5)
```

No computation occurs yet.

---

# Visualize the Task Graph

```python
result.visualize("task_graph.png")
```

Graphviz generates an image showing:

```text
square
   ↓
output
```

This helps illustrate how DASK organizes workloads before execution.

---

# Execute the Computation

Run:

```python
result.compute()
```

Output:

```python
25
```

At this point the task graph has been executed.

---

# DASK Workflow

A typical DASK workflow follows four stages:

### 1. Define Tasks

```python
@delayed
def process():
```

---

### 2. Build Task Graph

```python
task = process()
```

---

### 3. Visualize (Optional)

```python
task.visualize()
```

---

### 4. Execute

```python
task.compute()
```

---

# Running Parallel Operations

Suppose a workload consists of two independent calculations.

Traditional execution:

```text
Calculation A
       ↓
Calculation B
       ↓
Combine Results
```

DASK execution:

```text
Calculation A

Calculation B
       ↓
Combine Results
```

The independent calculations can be performed simultaneously.

---

# How DASK Uses CPU Cores

Modern processors contain multiple cores.

Example:

```text
Core 1
Core 2
Core 3
Core 4
```

DASK can assign different tasks to different cores.

Example:

```text
Core 1 → Task A

Core 2 → Task B

Core 3 → Task C

Core 4 → Task D
```

Result:

```text
Reduced execution time
```

---

# DASK and Parallel Computing

DASK automatically determines:

- Which tasks are independent
- Which tasks depend on others
- How to schedule execution
- How to optimize workloads

This allows developers to focus on solving problems rather than manually managing threads.

---

# Visualization Example

A typical DASK visualization might show:

```text
Read Data
      ↓

Transform A      Transform B
       \          /
        \        /
          Aggregate
               ↓
            Output
```

This immediately reveals opportunities for parallel execution.

---

# Key Takeaways

1. DASK is a Python framework for parallel and distributed computing.
2. DASK builds task graphs before execution.
3. DASK uses lazy evaluation.
4. Tasks execute only when `.compute()` is called.
5. Graphviz visualizes task graphs.
6. Task graphs illustrate execution order and dependencies.
7. Independent tasks can execute simultaneously.
8. DASK automatically schedules workloads across available CPU resources.
9. Parallel execution can significantly improve performance.
10. Visualization is a valuable tool for understanding and debugging parallel computations.

---

# Personal Notes

### Data Engineering Perspective

The concepts introduced in this video closely resemble technologies used in enterprise-scale analytics platforms:

| DASK Concept | Enterprise Equivalent |
|-------------|------------------------|
| Task Graph | Spark DAG |
| Delayed Tasks | Spark Transformations |
| Compute | Spark Action |
| Parallel Execution | Distributed Processing |
| Graph Visualization | Spark UI |

The workflow:

```text
Build Graph
     ↓
Optimize Graph
     ↓
Execute Tasks
```

appears across many modern data engineering tools including:

- Apache Spark
- Databricks
- AWS Glue
- Snowflake
- Ray
- DASK

Understanding task graphs and lazy evaluation provides a strong foundation for learning larger distributed processing platforms later in a data engineering career.