# Module 22 Coding Activities

## Overview

The coding activities in Module 22 focused on processing and streaming big data using DASK and Web Sockets. These activities provided hands-on experience with parallel computing, distributed processing, task scheduling, and real-time data streaming using Python.

The module gradually progressed from file creation and analysis using DASK to implementing socket-based communication for data streaming.

---

# Learning Outcomes

By completing these coding activities, I was able to:

- Create and process files in parallel using DASK.
- Read and analyze multiple files simultaneously.
- Simulate distributed computing environments.
- Understand DASK schedulers and workers.
- Visualize task execution through DASK task graphs.
- Implement client-server communication using sockets.
- Stream data between applications.
- Analyze packet-based communication and message framing.

---

# Coding Activity 22.1: Using DASK to Create Multiple Files in Parallel

## Objective

Learn how DASK can create multiple output files simultaneously through partitioned processing.

### Topics Covered

- DASK DataFrames
- Data partitioning
- Parallel file creation
- CSV output generation

### Skills Practiced

```python
import dask.dataframe as ddf
```

```python
df.to_csv()
```

### Key Concepts

- Data partitioning
- Parallel execution
- Chunking
- File generation

### Result

Successfully created multiple CSV output files using DASK partitions.

### Deliverables

```text
Coding_Activity_22_1.md
README.md
Screenshots
```

---

# Coding Activity 22.2: Using DASK to Read and Analyze Multiple Files in Parallel

## Objective

Learn how DASK processes multiple files simultaneously using wildcard patterns.

### Topics Covered

- Reading multiple files
- Wildcard file selection
- Parallel analytics
- DASK DataFrames

### Skills Practiced

```python
ddf.read_csv(
    "data/*.csv"
)
```

### Key Concepts

- Parallel file ingestion
- Scalable analytics
- Data aggregation
- Distributed processing

### Result

Successfully loaded and analyzed multiple files in parallel using DASK.

### Deliverables

```text
Coding_Activity_22_2.md
README.md
Screenshots
```

---

# Coding Activity 22.3: Simulating Parallel Processing

## Objective

Understand how DASK executes tasks using schedulers and workers.

### Topics Covered

- Distributed computing
- DASK Scheduler
- DASK Workers
- Client connections

### Skills Practiced

```python
from dask.distributed import Client
```

```python
client = Client(...)
```

### Key Concepts

#### Scheduler

Responsible for:

- Task assignment
- Dependency tracking
- Worker management

#### Workers

Responsible for:

- Executing computations
- Returning results

### Architecture

```text
Client
   ↓
Scheduler
   ↓
Workers
```

### Result

Successfully simulated distributed processing and observed task distribution among workers.

### Deliverables

```text
Coding_Activity_22_3.md
README.md
Screenshots
```

---

# Coding Activity 22.4: Streaming Web Sockets

## Objective

Implement socket-based communication and stream messages between a server and client.

### Topics Covered

- Socket programming
- Message headers
- Packet transmission
- Client-server communication
- Streaming data

### Skills Practiced

```python
import socket
```

### Server Operations

```python
socket.socket()
```

```python
bind()
```

```python
listen()
```

```python
accept()
```

### Client Operations

```python
connect()
```

```python
recv()
```

### Key Concepts

#### Packet Headers

Messages consisted of:

```text
Header + Payload
```

Example:

```text
30        The time is ...
```

#### Message Reconstruction

The activity demonstrated:

- Packet boundaries
- TCP streams
- Buffer management
- Message extraction

### Debugging

Used:

```text
VS Code Debugger
```

to inspect:

```python
msg
```

packet contents.

### Result

Successfully implemented a streaming socket connection and analyzed packet transmission using debugging tools.

### Deliverables

```text
Coding_Activity_22_4.md
README.md
Screenshots
```

---

# Technologies Used

## Python

Primary programming language used throughout all activities.

---

## DASK

Used for:

```text
Parallel Computing
Distributed Computing
Task Scheduling
Big Data Processing
```

---

## Graphviz

Used for:

```text
DASK Task Graph Visualization
```

---

## Socket Library

Used for:

```text
Client-Server Communication
Packet Transmission
Streaming Data
```

---

# Key Concepts Reinforced

## Parallel Computing

Large workloads can be divided into smaller tasks and executed simultaneously.

---

## Partitioning

Data can be divided into chunks to improve scalability and performance.

---

## Task Graphs

DASK uses task graphs to define:

- Task order
- Dependencies
- Parallel execution opportunities

---

## Distributed Processing

Schedulers and workers coordinate computations across resources.

---

## Packet Transmission

Data is transferred between applications using packets containing:

```text
Header
+
Payload
```

---

## Web Sockets

Persistent client-server communication supports real-time streaming applications.

---

# Challenges Encountered

## Graphviz Configuration

Task graph visualization required proper Graphviz installation and PATH configuration.

### Resolution

Added the Graphviz executable path to the Python/Jupyter environment.

---

## DASK Data Type Inference

DASK encountered datatype inference issues when reading CSV files.

### Resolution

Used:

```python
assume_missing=True
```

within:

```python
ddf.read_csv()
```

to resolve datatype inconsistencies.

---

## Packet Boundary Handling

The original streaming client incorrectly handled packet boundaries.

### Resolution

Used the corrected implementation to preserve remaining packet data and correctly reconstruct messages.

---

# Real-World Applications

The concepts practiced throughout these activities are commonly used in:

## Big Data Processing

- Databricks
- Apache Spark
- AWS Glue
- Azure Synapse
- Snowflake

---

## Distributed Analytics

- DASK
- Ray
- Spark Clusters
- Hadoop Ecosystems

---

## Real-Time Streaming

- Apache Kafka
- AWS Kinesis
- Azure Event Hubs
- RabbitMQ
- Web Socket Services

---

## Fleet Intelligence Systems

Examples:

- Vehicle tracking
- Geofence monitoring
- Driver analytics
- Fuel event monitoring
- Real-time dashboards

---

# Key Takeaways

1. DASK enables scalable parallel and distributed data processing.
2. Partitioning and chunking improve performance for large workloads.
3. Task graphs help visualize execution dependencies.
4. Distributed computing separates scheduling from execution.
5. Socket programming enables real-time communication between applications.
6. Packet headers are critical for message reconstruction.
7. TCP streams require careful handling of packet boundaries.
8. The same concepts are widely used in modern data engineering, streaming platforms, and large-scale analytics systems.

---

# Conclusion

The Module 22 coding activities provided practical experience with both batch-oriented and real-time data processing techniques. Through DASK, I learned how to partition, distribute, and parallelize large-scale computations. Through Web Socket programming, I gained experience implementing client-server communication and streaming data using packet-based transmission. Together, these activities reinforced key data engineering concepts that support modern analytics platforms, distributed systems, and real-time applications.