# Coding Activity 22.3: Simulating Parallel Processing Using DASK

## Overview

In this activity, I simulated distributed parallel processing using DASK. Unlike previous activities that focused on running tasks in parallel on a single machine, this activity introduced DASK's distributed computing architecture by creating a scheduler and multiple worker processes that collaborated to perform a large computation.

The goal was to simulate multiple machines working together through a scheduler-worker architecture and to execute a large-scale computation using a DASK client connected to the cluster.

---

# Learning Outcome

Run parallel operations in DASK.

---

# Activity Objectives

- Verify DASK installation.
- Start a DASK scheduler.
- Launch multiple DASK worker processes.
- Connect a DASK client to the scheduler.
- Create a large distributed array.
- Perform a distributed computation.
- Understand DASK scheduler-worker architecture.
- Simulate a distributed computing cluster.

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

## Libraries Used

```python
import dask.array as da
from dask.distributed import Client
```

---

# Step 1: Verify DASK Installation

## Objective

Verify that DASK is installed and available in the active Python environment.

## Command

```cmd
pip install dask
```

## Result

The terminal confirmed that DASK and its required dependencies were installed successfully.

Example output:

```text
Requirement already satisfied: dask
```

The package was available within the project virtual environment.

### Screenshot

```text
Step_1_DASK_Install.png
```

---

# Step 2: Start the DASK Scheduler

## Objective

Launch the DASK scheduler process.

## Command

```cmd
dask scheduler
```

## Result

The scheduler started successfully and provided a TCP address used by workers and clients.

### Scheduler Address

```text
tcp://10.35.154.229:8786
```

### Dashboard Address

```text
http://10.35.154.229:8787/status
```

The scheduler acts as the central coordinator of all distributed computations.

### Screenshot

```text
Step_2_DASK_Scheduler.png
```

---

# Step 3A: Start Worker Process #1

## Objective

Launch the first DASK worker and connect it to the scheduler.

## Command

```cmd
dask worker tcp://10.35.154.229:8786
```

## Result

The worker connected successfully and registered with the scheduler.

### Key Messages

```text
Registered to: tcp://10.35.154.229:8786
```

```text
Starting established connection to tcp://10.35.154.229:8786
```

### Worker Resources

```text
Threads: 16
Memory: 31.73 GiB
```

### Screenshot

```text
Step_3_Worker_1.png
```

---

# Step 3B: Start Worker Process #2

## Objective

Launch a second DASK worker and connect it to the scheduler.

## Command

```cmd
dask worker tcp://10.35.154.229:8786
```

## Result

The second worker connected successfully and registered with the scheduler.

### Key Messages

```text
Registered to: tcp://10.35.154.229:8786
```

```text
Starting established connection to tcp://10.35.154.229:8786
```

### Worker Resources

```text
Threads: 16
Memory: 31.73 GiB
```

### Screenshot

```text
Step_3_Worker_2.png
```

---

# Cluster Architecture

At this stage, the DASK cluster consisted of:

```text
Scheduler
tcp://10.35.154.229:8786
            │
      ┌─────┴─────┐
      │           │

 Worker 1     Worker 2
```

The scheduler coordinated all computations while both workers executed assigned tasks.

---

# Step 4: Create the Jupyter Notebook Client

## Objective

Create a Jupyter Notebook that acts as the DASK client application.

## Code

```python
import dask.array as da
from dask.distributed import Client
```

## Result

The notebook successfully imported the required DASK libraries and was ready to submit computations to the scheduler.

### Screenshot

```text
Step_4_Jupyter_Imports.png
```

---

# Step 5: Create a Large Distributed Matrix

## Objective

Create a large DASK array and define a computation.

## Code

```python
x = da.random.random((50000, 50000))

y = da.exp(x).mean()
```

## Explanation

A distributed matrix containing:

```text
50,000 rows
50,000 columns
```

was created using DASK.

The computation:

```python
da.exp(x).mean()
```

calculates the mean of the exponential values contained in the matrix.

At this stage no computation was executed.

DASK created a task graph and delayed execution until requested.

### Screenshot

```text
Step_5_Matrix_Creation.png
```

---

# Step 6: Connect to the Scheduler and Compute

## Objective

Connect to the scheduler and execute the distributed computation.

## Code

```python
client = Client("tcp://10.35.154.229:8786")

y.compute()
```

## Result

The DASK client connected successfully to the scheduler.

The scheduler distributed the workload across the available worker processes.

The distributed computation completed successfully.

### Output

```text
np.float64(1.7182952835662113)
```

### Screenshot

```text
Step_6_Compute_Result.png
```

---

# Final Notebook

```python
import dask.array as da
from dask.distributed import Client

x = da.random.random((50000, 50000))

y = da.exp(x).mean()

client = Client("tcp://10.35.154.229:8786")

y.compute()
```

---

# Results Summary

| Metric | Result |
|----------|----------|
| Matrix Size | 50,000 × 50,000 |
| Scheduler | Running |
| Worker Processes | 2 |
| Computation | Mean of exponential values |
| Final Result | 1.7182952835662113 |

---

# Key Concepts Demonstrated

## Scheduler-Worker Architecture

DASK uses a centralized scheduler that distributes tasks to workers.

```text
Client
   ↓
Scheduler
   ↓
Workers
```

---

## Distributed Computing

Work was distributed across multiple worker processes instead of executing on a single process.

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

## Task Scheduling

The scheduler automatically assigned tasks to available workers.

---

## Scalability

Additional workers could be added to increase processing capacity.

---

# Real-World Applications

The concepts demonstrated in this activity are commonly used in:

- Apache Spark clusters
- Databricks environments
- AWS Glue jobs
- Hadoop ecosystems
- Machine learning pipelines
- Data lake analytics
- Scientific computing
- Fleet telemetry analytics
- Utility asset analytics

---

# Key Takeaways

1. DASK supports distributed computing through scheduler-worker architecture.
2. A scheduler coordinates task execution and worker activity.
3. Worker processes execute computations assigned by the scheduler.
4. DASK arrays support large-scale numerical computations.
5. The `compute()` method triggers task execution.
6. Distributed computing allows workloads to scale beyond a single machine.
7. The same distributed-processing concepts are used in major enterprise data platforms.

---

# Conclusion

In this activity, I successfully simulated distributed processing using DASK. A scheduler was launched and two worker processes were connected to form a small distributed computing cluster. Using a Jupyter Notebook client, I created a 50,000 × 50,000 DASK array, defined a large-scale computation, and submitted the workload to the scheduler using a DASK client connection. The scheduler distributed the work across the worker processes and returned the final result. This activity demonstrated the core principles of distributed computing, including task scheduling, worker coordination, lazy evaluation, and scalable parallel processing using DASK.