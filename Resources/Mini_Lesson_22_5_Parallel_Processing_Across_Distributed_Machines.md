# Mini-Lesson 22.5: Parallel Processing Across Distributed Machines

## Overview

In previous lessons, DASK was used to execute tasks in parallel on a single machine using multiple CPU cores. In this lesson, DASK is extended to support distributed computing by allowing computations to be executed across multiple machines connected through a network.

DASK achieves this through a scheduler-worker architecture that distributes workloads, coordinates tasks, and aggregates results from multiple processing nodes.

---

# Prerequisites

## Windows Users

Before using DASK distributed computing on Windows, a local installation of Anaconda is recommended.

Launch:

```text
Anaconda Prompt
```

from the Start Menu.

This environment provides:

- Python
- Jupyter Notebook
- Package management
- DASK support

---

## MacOS Users

MacOS users can use:

```text
Terminal
```

with either:

- Native Python installation
- Anaconda installation

Note that MacOS does not provide a separate Anaconda Prompt.

---

# From Parallel Computing to Distributed Computing

So far, DASK has been running tasks on a single machine.

Example:

```text
Laptop
│
├── CPU Core 1
├── CPU Core 2
├── CPU Core 3
└── CPU Core 4
```

All processing occurs locally.

---

Distributed computing expands this approach:

```text
Machine 1

Machine 2

Machine 3

Machine 4
```

Multiple computers work together to solve a common problem.

---

# DASK Distributed Architecture

DASK uses two primary components:

```text
Scheduler
Workers
```

### Scheduler

The scheduler serves as the central coordinator.

Responsibilities include:

- Tracking tasks
- Scheduling execution
- Managing dependencies
- Monitoring workers
- Collecting results

---

### Workers

Workers perform computations assigned by the scheduler.

Responsibilities include:

- Executing tasks
- Processing data
- Returning results

---

# Distributed Architecture Diagram

```text
           Scheduler
                │
      ┌─────────┼─────────┐
      │         │         │
      ▼         ▼         ▼

   Worker 1  Worker 2  Worker 3
```

All workers communicate with the scheduler.

---

# Starting the Scheduler

A scheduler must be started before workers can connect.

Current DASK command:

```bash
dask scheduler
```

Older versions used:

```bash
dask-scheduler
```

which is now deprecated.

---

## Scheduler Output

When started, DASK displays a TCP address.

Example:

```text
tcp://192.168.1.82:8786
```

This address identifies the scheduler.

### Important

Your actual address may differ.

Example:

```text
tcp://192.168.0.10:8786
```

Always use the address generated on your machine.

---

# Starting a Worker

Open a second terminal window.

Connect a worker:

```bash
dask worker tcp://192.168.1.82:8786
```

Older versions used:

```bash
dask-worker tcp://192.168.1.82:8786
```

which is now deprecated.

---

# Worker Registration

After the worker starts, the scheduler recognizes and registers the worker.

Result:

```text
Scheduler
      ↓
Worker Connected
```

The worker is now available for task execution.

---

# Adding Additional Workers

Open another terminal window and launch a second worker:

```bash
dask worker tcp://192.168.1.82:8786
```

The architecture becomes:

```text
           Scheduler
                │
         ┌──────┴──────┐
         ▼             ▼

     Worker 1     Worker 2
```

---

# Simulation vs Real Cluster

For this lesson:

```text
Scheduler
Worker 1
Worker 2
```

are all running on the same computer.

However, DASK also supports:

```text
Different Machines
Different Servers
Cloud Resources
```

The architecture remains the same.

---

# Connecting a Client

DASK computations are submitted through a client.

Import the client:

```python
from dask.distributed import Client
```

Create a connection:

```python
client = Client(
    "tcp://192.168.1.82:8786"
)
```

The client communicates directly with the scheduler.

---

# Example Computation

Create a large DASK array:

```python
import dask.array as da

x = da.random.random(
    (40000, 40000)
)
```

This creates a matrix of random values:

```text
40,000 rows

40,000 columns
```

---

# Perform a Computation

Calculate:

```python
y = da.exp(x).sum()
```

This operation:

1. Computes the exponential value for each cell.
2. Sums all values.

---

# Connect to the Scheduler

```python
from dask.distributed import Client

client = Client(
    "tcp://192.168.1.82:8786"
)
```

The client now submits the task to the scheduler.

---

# Execute the Computation

```python
y.compute()
```

Workflow:

```text
Client
   ↓
Scheduler
   ↓
Workers
   ↓
Results Returned
```

The workload is automatically distributed among available workers.

---

# Data Partitioning

Large datasets are divided into partitions.

Example:

```text
40,000 x 40,000 Matrix
```

becomes:

```text
Partition A
Partition B
Partition C
Partition D
```

Each worker processes separate partitions.

---

# Benefits of Distributed Processing

## Improved Performance

Multiple workers process tasks simultaneously.

---

## Better Resource Utilization

Memory and CPU resources are shared across machines.

---

## Larger Workloads

Datasets larger than the memory of a single machine can be processed.

---

## Scalability

Additional workers can be added as workloads grow.

---

# Fault Tolerance

If a worker fails:

```text
Worker Loss
      ↓
Scheduler Detects Failure
      ↓
Task Reassigned
```

This improves reliability in distributed environments.

---

# Typical Distributed Workflow

```text
Client
    ↓
Scheduler
    ↓
Task Assignment
    ↓
Workers
    ↓
Parallel Execution
    ↓
Results Combined
```

The user interacts with the system as if it were a single machine.

---

# Real-World Data Engineering Applications

## Data Lakes

```text
S3 Files
     ↓
DASK Cluster
     ↓
Analytics
```

---

## ETL Pipelines

```text
Raw Data
      ↓
Distributed Processing
      ↓
Transformations
      ↓
Storage
```

---

## Machine Learning

```text
Training Data
      ↓
Feature Engineering
      ↓
Distributed Computation
```

---

## Utility Analytics

Examples:

- Service records
- Leak survey data
- Inspection data
- Work orders
- Asset inventories

Large operational datasets can be processed more efficiently using distributed resources.

---

## Fleet Intelligence Analytics

Examples:

- GPS telemetry
- Fuel transactions
- Maintenance events
- Geofence activity

These workloads can be distributed across multiple machines for faster processing.

---

# Distributed DASK vs Local DASK

| Feature | Local DASK | Distributed DASK |
|----------|----------|----------|
| Single Machine | Yes | Optional |
| Multiple CPU Cores | Yes | Yes |
| Multiple Machines | No | Yes |
| Scalable Memory | Limited | Yes |
| Scheduler | Optional | Required |
| Workers | Local Processes | Multiple Processes or Machines |

---

# Key Takeaways

1. DASK can distribute processing across multiple machines.
2. Distributed computing extends parallel processing beyond a single computer.
3. DASK uses a scheduler-worker architecture.
4. The scheduler coordinates all computations.
5. Workers perform computations and return results.
6. Clients submit jobs to the scheduler.
7. Large datasets are partitioned into smaller chunks.
8. Distributed computing improves scalability and performance.
9. Worker nodes can run on separate computers.
10. The same concepts are used in Spark, Databricks, Hadoop, and other enterprise data platforms.

---

# Personal Notes

### Data Engineering Perspective

This lesson introduces concepts that appear throughout modern big data platforms.

Common architecture:

```text
Client
     ↓
Scheduler
     ↓
Workers
     ↓
Distributed Processing
     ↓
Results
```

This pattern exists in:

- DASK
- Apache Spark
- Databricks
- AWS Glue
- Hadoop
- Ray

The most important takeaway is understanding how distributed systems divide work into partitions, assign those partitions to worker nodes, and coordinate execution through a centralized scheduler. As datasets continue growing beyond the capacity of individual machines, distributed computing becomes a foundational skill for data engineers.