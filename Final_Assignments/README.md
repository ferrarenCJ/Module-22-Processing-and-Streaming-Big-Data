# Module 22 Final Assignments

## Overview

The final assignments in Module 22 combined the major concepts covered throughout the module, including parallel computing, distributed processing, DASK, Web Sockets, and real-time data streaming. The assignments provided practical experience implementing large-scale data processing workflows and client-server communication systems using Python.

Module 22 consisted of two final assignments:

1. Final_Assignment_22_1_Processing_and_Streaming_Big_Data
2. Final_Assignment_22_1_Part2_Web_Socket_Streaming

Together, these assignments reinforced both batch-processing and streaming data engineering concepts.

---

# Learning Outcomes

By completing the final assignments, I was able to:

- Run parallel operations using DASK.
- Compare the performance of NumPy, Pandas, and DASK.
- Analyze task graphs and partitioning strategies.
- Create large datasets for benchmarking.
- Implement socket-based communication.
- Stream data through Web Sockets.
- Build client-server applications.
- Understand packet transmission and message framing.

---

# Final Assignment 22.1 (Part 1): Processing and Streaming Big Data

## Overview

Part 1 focused on comparing the performance of NumPy, Pandas, and DASK when processing arrays and dataframes. The assignment explored how chunking, partitioning, and parallel execution influence computational performance.

---

## Section 1: NumPy vs DASK

### Objectives

- Create large NumPy arrays.
- Convert arrays into DASK arrays.
- Partition data into chunks.
- Visualize DASK task graphs.
- Benchmark analytical computations.

### Key Activities

#### Create NumPy Array

```python
arr = np.random.randint(
    1,
    1001,
    (2000, 2000)
)
```

---

#### Create DASK Array

```python
darr = da.from_array(
    arr,
    chunks=(250, 250)
)
```

Result:

```text
64 total chunks
```

---

#### Visualize DASK Task Graph

```python
res.visualize()
```

Used Graphviz to display:

- Chunk operations
- Aggregation stages
- Task dependencies

---

#### Performance Benchmark

Compared:

```python
numpy_arr_chk()
```

and

```python
dask_arr_chk()
```

### Key Outcome

DASK demonstrated the ability to partition computations and execute tasks in parallel across chunks.

---

## Section 2: Pandas vs DASK

### Objectives

- Load data using Pandas and DASK.
- Benchmark data ingestion.
- Create larger benchmark datasets.
- Compare aggregation performance.

### Dataset

```text
salary.csv
```

---

#### Pandas

```python
pd.read_csv()
```

---

#### DASK

```python
ddf.read_csv(
    'salary.csv',
    assume_missing=True
)
```

---

#### Large Dataset Creation

```python
df_pandas_big
```

```python
df_dask_big
```

---

#### Repartition Data

```python
repartition(
    npartitions=2
)
```

---

### Key Outcome

The benchmarking exercise illustrated that:

- Smaller datasets often favor Pandas because of lower overhead.
- DASK becomes increasingly valuable as workloads grow larger and benefit from parallel processing.

---

## Skills Demonstrated

- NumPy Arrays
- DASK Arrays
- Pandas DataFrames
- DASK DataFrames
- Chunking
- Partitioning
- Parallel Computing
- Distributed Processing
- Performance Benchmarking
- Task Graph Analysis

---

## Deliverables

```text
Final_Assignment_22_1.md
README.md
Screenshots
Completed Jupyter Notebook
```

---

# Final Assignment 22.1 (Part 2): Processing and Streaming Big Data

## Overview

Part 2 focused on implementing client-server communication using Python sockets. The assignment explored packet construction, message headers, Web Socket communication concepts, and streaming data between applications.

---

## Objectives

- Configure a socket server.
- Configure a socket client.
- Modify communication ports.
- Stream packetized messages.
- Implement thread-based timing.
- Verify packet transmission.
- Analyze client-server communication.

---

## Server Configuration

### Update Port

Changed:

```text
7000
```

### Configuration

```python
ws.bind(
    (socket.gethostname(), 7000)
)
```

---

## Thread Timing

Modified:

```python
time.thread_time()
```

### Code

```python
msg = f"The time is {time.thread_time()}"
```

---

## Client Configuration

Updated:

```python
ws.connect(
    (socket.gethostname(), 7000)
)
```

to match the server configuration.

---

## Communication Workflow

### Server

```text
Listen
   ↓
Accept Connection
   ↓
Create Message
   ↓
Build Header
   ↓
Transmit Packet
```

---

### Client

```text
Connect
   ↓
Receive Packet
   ↓
Read Header
   ↓
Extract Message
   ↓
Display Output
```

---

## Packet Structure

Messages contained:

```text
Header + Payload
```

Example:

```text
19        The time is 0.03125
```

---

## Key Outcome

Successfully established communication between the server and client and streamed packetized messages in real time.

---

## Skills Demonstrated

- Socket Programming
- TCP Communication
- Client-Server Architecture
- Packet Headers
- Message Framing
- Web Socket Concepts
- Streaming Data
- Real-Time Communication

---

## Deliverables

```text
Final_Assignment_22_1_Part2.md
README.md
Screenshots
Submission Document
```

---

# Technologies Used

## Python

Used throughout both assignments.

---

## NumPy

Used for:

- Numerical computation
- Array processing
- Performance benchmarking

---

## Pandas

Used for:

- Data ingestion
- Data analysis
- Aggregation

---

## DASK

Used for:

- Parallel computing
- Distributed processing
- Data partitioning
- Task graph execution

---

## Graphviz

Used to visualize DASK task graphs.

---

## Socket Library

Used for:

- Network communication
- Message transmission
- Client-server interaction

---

# Major Concepts Reinforced

## Parallel Computing

Large workloads can be divided into:

```text
Chunks
Tasks
Partitions
```

and executed in parallel.

---

## Distributed Computing

Schedulers and workers coordinate computational workloads.

---

## Task Graphs

Graphs visualize:

- Task dependencies
- Execution paths
- Aggregation operations

---

## Streaming Systems

Real-time communication relies on:

```text
Clients
Servers
Packets
Headers
TCP
```

---

## Packet Processing

Messages must be:

```text
Created
Transferred
Received
Decoded
```

to support reliable communication.

---

# Real-World Applications

The concepts covered throughout these assignments are commonly used in:

## Analytics Platforms

- Databricks
- Apache Spark
- Snowflake
- AWS Glue
- Azure Synapse

---

## Distributed Processing Systems

- DASK
- Ray
- Hadoop
- Spark Clusters

---

## Streaming Platforms

- Apache Kafka
- AWS Kinesis
- Azure Event Hubs
- RabbitMQ

---

## Fleet Intelligence Systems

Examples:

- Vehicle tracking
- GPS telemetry
- Driver activity monitoring
- Fuel event detection
- Geofence alerts

---

## Utility Analytics

Examples:

- Asset integrity analysis
- Pipeline risk modeling
- GIS processing
- Inspection analytics

---

# Key Takeaways

1. DASK enables scalable parallel and distributed computation.
2. Chunking and partitioning improve processing efficiency.
3. Performance benchmarking helps identify the most appropriate tool for a workload.
4. Small datasets often favor Pandas and NumPy because of their lower overhead.
5. Task graphs provide visibility into computational workflows.
6. Socket programming enables direct communication between applications.
7. Packet headers support message reconstruction and reliable communication.
8. Streaming architectures are fundamental to modern real-time systems.
9. Web Sockets provide persistent communication channels between clients and servers.
10. The concepts covered in these assignments directly support modern data engineering, analytics, and streaming platforms.

---

# Conclusion

The Module 22 final assignments combined parallel computing and streaming communication into practical, hands-on exercises. Part 1 focused on benchmarking and comparing the performance of NumPy, Pandas, and DASK, while Part 2 explored client-server communication and real-time data streaming using Python sockets. Together, these assignments reinforced the core principles of distributed computing, scalable data processing, packet-based communication, and real-time analytics that are commonly used in modern data engineering environments.