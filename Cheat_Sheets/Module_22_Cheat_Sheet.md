# Module 22 Cheat Sheet: Processing and Streaming Big Data

## Big Data Storage Formats

### Apache Parquet

**Best For**
- Data lakes
- Data warehouses
- Analytics workloads
- Long-term storage

**Advantages**
- Columnar storage
- High compression
- Faster analytical queries
- Reduced storage requirements

**Example**

```python
df.to_parquet("data.parquet")
```

---

### Apache Feather

**Best For**
- Temporary storage
- Data science workflows
- Fast read/write operations

**Advantages**
- Extremely fast I/O
- Efficient data exchange
- Lightweight format

**Example**

```python
df.to_feather("data.feather")
```

---

## Pandas vs Parquet vs Feather

| Feature | Pandas CSV | Parquet | Feather |
|----------|----------|----------|----------|
| Read Speed | Slow | Fast | Very Fast |
| Write Speed | Slow | Fast | Very Fast |
| Compression | None | Excellent | Minimal |
| Storage Efficiency | Low | High | Medium |
| Analytics | Good | Excellent | Good |

---

# Parallel Computing

## Sequential Processing

```text
Task 1
   ↓
Task 2
   ↓
Task 3
```

One operation executes at a time.

---

## Parallel Processing

```text
Task 1

Task 2

Task 3
```

Multiple operations execute simultaneously.

---

## Benefits

✅ Faster execution

✅ Better scalability

✅ More efficient resource utilization

✅ Improved processing of big data

---

# Key Parallel Computing Terms

| Term | Definition |
|--------|--------|
| Core | CPU processing unit |
| Thread | Smallest unit of execution |
| Task | Unit of work |
| Lock | Resource protection mechanism |
| Semaphore | Signaling mechanism between threads |
| Race Condition | Multiple threads accessing the same resource simultaneously |
| Time Slicing | CPU scheduling method |

---

# DASK

## What is DASK?

Open-source Python library for:

```text
Parallel Computing
Distributed Computing
Big Data Processing
```

---

## Import DASK

### DataFrames

```python
import dask.dataframe as ddf
```

### Arrays

```python
import dask.array as da
```

### Distributed Client

```python
from dask.distributed import Client
```

---

## Create DASK DataFrame

```python
df = ddf.read_csv(
    "data.csv"
)
```

---

## Create DASK Array

```python
darr = da.from_array(
    arr,
    chunks=(250, 250)
)
```

---

## Compute Results

DASK uses lazy evaluation.

Execute tasks using:

```python
.compute()
```

Example:

```python
df.mean().compute()
```

---

## Visualize Task Graph

```python
result.visualize()
```

Used to display:

- Task dependencies
- Execution order
- Parallel operations

Requires:

```python
graphviz
```

---

## Partitions

Display partition count:

```python
df.npartitions
```

---

## Repartition Data

```python
df = df.repartition(
    npartitions=2
)
```

---

# DASK Architecture

```text
Client
   ↓
Scheduler
   ↓
Workers
```

### Client

Submits tasks.

### Scheduler

Assigns tasks.

### Workers

Execute computations.

---

# NumPy vs DASK

## NumPy

Best For:

- In-memory arrays
- Smaller datasets
- Fast numerical operations

Example:

```python
arr.mean()
```

---

## DASK

Best For:

- Large datasets
- Parallel execution
- Distributed processing

Example:

```python
darr.mean().compute()
```

---

# Pandas vs DASK

## Pandas

Advantages:

- Simple
- Fast for small datasets
- Minimal overhead

Example:

```python
df = pd.read_csv(
    "data.csv"
)
```

---

## DASK

Advantages:

- Partitioned processing
- Handles larger-than-memory data
- Parallel execution

Example:

```python
df = ddf.read_csv(
    "data.csv",
    assume_missing=True
)
```

---

# Benchmark Timing

Measure execution time:

```python
import time

start = time.time()

# code

end = time.time()
```

---

# Wall Time

Definition:

```text
Actual elapsed execution time
```

Example:

```text
Wall Time: 0.825 seconds
```

---

# Graphviz

Used for:

```text
DASK Task Graph Visualization
```

Import:

```python
import graphviz
```

Visualize:

```python
result.visualize()
```

---

# Web Sockets

## What Are Web Sockets?

Persistent communication channel between:

```text
Client ⇄ Server
```

---

## Benefits

✅ Real-time communication

✅ Bidirectional messaging

✅ Lower latency

✅ Continuous connection

---

## Web Socket URLs

```text
ws://
```

Unsecured connection

```text
wss://
```

Secure connection

---

# Long Polling vs Web Sockets

| Feature | Long Polling | Web Sockets |
|----------|----------|----------|
| Real-Time | Limited | Yes |
| Persistent Connection | No | Yes |
| Overhead | Higher | Lower |
| Bidirectional | No | Yes |

---

# Socket Programming

## Import Library

```python
import socket
```

---

## Create Server

```python
ws = socket.socket(
    socket.AF_INET,
    socket.SOCK_STREAM
)
```

---

## Bind Port

```python
ws.bind(
    (socket.gethostname(), 7000)
)
```

---

## Listen

```python
ws.listen(5)
```

---

## Accept Client

```python
(clientsocket, address) = ws.accept()
```

---

## Send Packet

```python
clientsocket.send(
    bytes(msg, 'utf-8')
)
```

---

## Create Client

```python
ws.connect(
    (socket.gethostname(), 7000)
)
```

---

# Packet Structure

## Header + Payload

Example:

```text
19        The time is 0.03125
```

### Header

```text
19
```

Message length

### Payload

```text
The time is 0.03125
```

Actual data

---

# Message Header Creation

```python
msg = f"{len(msg):<{HEADER}}" + msg
```

---

# Thread Timing

Current thread CPU time:

```python
time.thread_time()
```

Example:

```python
msg = f"The time is {time.thread_time()}"
```

---

# TCP

## Transmission Control Protocol

Provides:

✅ Reliable communication

✅ Ordered delivery

✅ Error checking

✅ Packet transmission

---

# Packet Flow

```text
Client
   ↓
TCP Packet
   ↓
Server
```

---

# Real-World Applications

## DASK

- Databricks
- Apache Spark alternatives
- AWS Analytics
- Large CSV processing
- Data lake analytics

---

## Web Sockets

- Chat applications
- Stock market feeds
- Live dashboards
- GPS tracking
- Fleet management systems
- IoT telemetry
- Real-time monitoring

---

# Module 22 Tips

### Remember

✅ DASK = Parallel + Distributed Processing

✅ Parquet = Best for analytics

✅ Feather = Best for fast I/O

✅ `.compute()` executes DASK operations

✅ `.visualize()` displays task graphs

✅ `npartitions` displays partition count

✅ `repartition()` changes partition count

✅ Web Sockets are bidirectional

✅ TCP uses packets

✅ Packets = Header + Payload

✅ `time.thread_time()` returns current thread CPU time

✅ DASK performs best with larger workloads and parallel execution opportunities

✅ Pandas often performs better on smaller in-memory datasets