# Coding Activity 22.3: Simulating Parallel Processing Using DASK

## Overview

This coding activity focused on simulating distributed computing using DASK. Unlike previous activities that executed parallel operations on a single machine, this activity introduced a distributed architecture consisting of a scheduler, multiple worker processes, and a client application.

A DASK cluster was created locally to simulate multiple machines working together. The scheduler coordinated two worker processes, and a Jupyter Notebook client submitted a large distributed computation to the cluster.

---

# Learning Outcome

Run parallel operations in DASK.

---

# Activity Summary

The activity consisted of four major phases:

### Verify DASK Installation

Verified that DASK was installed and available in the Python virtual environment.

### Create a DASK Cluster

Established a distributed DASK environment consisting of:

- One Scheduler
- Two Worker Processes

### Create a Distributed Computation

Generated a large distributed array and defined a mathematical computation.

### Execute the Computation

Connected a DASK client to the scheduler and distributed the computation across the worker nodes.

---

# Technologies Used

## Python

Used to create and execute the distributed computation.

## DASK

Used for:

- Distributed computing
- Task scheduling
- Worker management
- Parallel computation
- Cluster coordination

## Jupyter Notebook

Used as the client application that submitted the workload to the DASK cluster.

## Visual Studio Code

Used to manage terminals, worker processes, and notebook execution.

---

# Cluster Configuration

## Scheduler

```text
tcp://10.35.154.229:8786
```

The scheduler coordinated all worker activity and managed task distribution.

---

## Worker Processes

```text
Worker 1
```

```text
Worker 2
```

Each worker successfully connected to the scheduler and became available to process tasks.

---

## Cluster Architecture

```text
Client
   │
   ▼

Scheduler
   │
   ├── Worker 1
   │
   └── Worker 2
```

---

# Key Code

## Import DASK Libraries

```python
import dask.array as da
from dask.distributed import Client
```

---

## Create Distributed Array

```python
x = da.random.random((50000, 50000))
```

---

## Define Computation

```python
y = da.exp(x).mean()
```

---

## Connect to Scheduler

```python
client = Client("tcp://10.35.154.229:8786")
```

---

## Execute Computation

```python
y.compute()
```

---

# Results

| Metric | Result |
|----------|----------|
| Array Size | 50,000 × 50,000 |
| Scheduler | Running |
| Worker Processes | 2 |
| Computation | Mean of Exponential Values |
| Final Result | 1.7182952835662113 |

---

# Key Concepts Demonstrated

## Distributed Computing

Work was distributed across multiple worker processes instead of executing on a single process.

---

## Scheduler-Worker Architecture

The scheduler coordinated task execution while workers performed computations.

---

## DASK Arrays

Large numerical datasets can be partitioned and processed efficiently.

---

## Lazy Evaluation

The computation was not executed until:

```python
y.compute()
```

was called.

---

## Distributed Task Execution

The scheduler automatically distributed work among available workers and combined the results.

---

# Real-World Applications

The concepts demonstrated in this activity are commonly used in:

- Apache Spark Clusters
- Databricks Workspaces
- AWS Glue Jobs
- Hadoop Ecosystems
- Machine Learning Pipelines
- Scientific Computing
- Data Lake Analytics
- Utility Asset Analytics
- Fleet Telemetry Processing

---

# Key Takeaways

1. DASK supports distributed computing through a scheduler-worker architecture.
2. A scheduler coordinates computations across worker processes.
3. Worker processes execute distributed tasks concurrently.
4. DASK arrays enable large-scale numerical computing.
5. The `compute()` function triggers execution of delayed operations.
6. Distributed computing improves scalability and resource utilization.
7. The same concepts are used by Spark, Databricks, AWS Glue, and other enterprise big-data platforms.

---

# Conclusion

In this activity, I simulated distributed computing using DASK by creating a scheduler and connecting two worker processes. A DASK client running in a Jupyter Notebook submitted a large-scale computation involving a 50,000 × 50,000 distributed array. The scheduler coordinated the workload and distributed tasks across the connected workers. The computation successfully completed and returned the final result. This activity demonstrated the fundamental principles of distributed computing, including scheduler coordination, worker execution, task distribution, lazy evaluation, and scalable parallel processing.