# Module 22: Processing and Streaming Big Data

## Overview

Module 22 focused on two major areas of modern data engineering:

1. Processing large datasets using parallel and distributed computing techniques.
2. Streaming data through persistent client-server communication channels.

The module introduced DASK for scalable data processing and Web Sockets for real-time communication. Through lectures, coding activities, discussions, assignments, and practical exercises, the module demonstrated how modern data engineering systems process, analyze, and stream large volumes of data efficiently.

---

# Module Learning Outcomes

By completing Module 22, I was able to:

- Understand parallel computing concepts.
- Use DASK for distributed data processing.
- Create and analyze DASK arrays and dataframes.
- Partition large datasets into manageable chunks.
- Visualize DASK task graphs.
- Compare the performance of NumPy, Pandas, and DASK.
- Implement client-server communication using Python sockets.
- Understand packet transmission and message framing.
- Stream data using Web Socket concepts.

---

# Module Structure

## Videos

The video lessons introduced the core concepts of:

- Apache Parquet
- Apache Feather
- Parallel Computing
- Parallel Processing
- DASK
- Distributed Computing
- Web Sockets
- TCP Communication
- Data Streaming

### Key Deliverable

```text
Videos/README.md
```

---

## Discussions

The discussions focused on practical applications of module concepts.

### Discussion Topics

#### Discussion 22.1

Use Cases for Parallel Computing

Examples:

- Machine learning
- Utility analytics
- Big data processing
- Distributed workloads

---

#### Discussion 22.2

Use Cases of Web Sockets

Examples:

- Fleet management
- GPS tracking
- Stock market feeds
- Real-time dashboards

---

#### Self-Study Discussion 22.1

Sharing learning resources related to:

- DASK documentation
- Socket programming tutorials
- Supplemental study materials

### Key Deliverable

```text
Discussions/README.md
```

---

## Coding Activities

Module 22 included four coding activities designed to reinforce parallel computing and streaming concepts.

### Coding Activity 22.1

Using DASK to Create Multiple Files in Parallel

Topics:

- DASK DataFrames
- File generation
- Parallel processing

---

### Coding Activity 22.2

Using DASK to Read and Analyze Multiple Files in Parallel

Topics:

- Wildcard file loading
- Distributed data analysis
- Parallel execution

---

### Coding Activity 22.3

Simulating Parallel Processing

Topics:

- DASK Scheduler
- DASK Workers
- Distributed architecture

---

### Coding Activity 22.4

Streaming Web Sockets

Topics:

- Socket programming
- Message headers
- Packet transmission
- Real-time communication

### Key Deliverable

```text
Coding_Activities/README.md
```

---

## Knowledge Checks

The knowledge checks reinforced concepts related to:

- Sequential computing
- Parallel computing
- Threads
- Race conditions
- Web Sockets
- TCP/IP communication
- Packet transmission

### Key Deliverable

```text
Knowledge_Checks/README.md
```

---

## Final Assignments

Module 22 included two final assignments.

---

### Final Assignment 22.1 (Part 1)

Processing and Streaming Big Data

#### Topics

- NumPy vs DASK benchmarking
- Pandas vs DASK benchmarking
- Chunking
- Partitioning
- Task graph visualization
- Dataframe performance analysis

#### Key Skills

- DASK Arrays
- DASK DataFrames
- Benchmarking
- Parallel processing

---

### Final Assignment 22.1 (Part 2)

Processing and Streaming Big Data

#### Topics

- Python sockets
- Client-server architecture
- Packet transmission
- Web Socket concepts
- Real-time communication

#### Key Skills

- Socket programming
- Message framing
- Streaming data
- Port configuration

### Key Deliverable

```text
Final_Assignments/README.md
```

---

## Resources

The Resources section included:

### Glossary

Definitions for:

- DASK
- Parallel Processing
- Task Graphs
- Web Sockets
- TCP
- Packets
- Race Conditions

---

### Video Transcripts and References

Provided:

- Lecture transcripts
- Supporting references
- Supplemental learning material

---

### Solution Files

Official solutions for:

- Coding Activities
- Try-It Activities
- Final Assignments

---

### Cheat Sheet

Quick-reference guide containing:

- DASK commands
- Socket programming examples
- Benchmarking techniques
- Key concepts

### Key Deliverable

```text
Resources/README.md
```

---

## Cheat Sheets

The cheat sheet consolidated the most important module concepts into a single reference guide.

### Topics Covered

- Apache Parquet
- Apache Feather
- DASK Arrays
- DASK DataFrames
- Graphviz
- Parallel Computing
- Web Sockets
- Socket Programming
- Packet Headers
- TCP Communication

### Key Deliverable

```text
Cheat_Sheets/README.md
```

---

## Sandbox

The Sandbox environment was used for:

- DASK experimentation
- Performance benchmarking
- Graphviz validation
- Socket testing
- Troubleshooting exercises

### Key Deliverable

```text
Sandbox/README.md
```

---

# Technologies Used

## Data Processing

```text
NumPy
Pandas
DASK
```

---

## Storage Formats

```text
Apache Parquet
Apache Feather
```

---

## Distributed Computing

```text
DASK Scheduler
DASK Workers
Graphviz
```

---

## Communication

```text
TCP
Python Sockets
Web Sockets
```

---

# Key Concepts Learned

## Parallel Computing

Large workloads can be divided into smaller tasks and executed simultaneously.

Benefits:

- Improved performance
- Better scalability
- Efficient resource utilization

---

## Partitioning

Large datasets can be divided into smaller chunks for distributed processing.

Example:

```text
2000 × 2000 Array
        ↓
250 × 250 Chunks
        ↓
64 Chunks
```

---

## DASK Task Graphs

Task graphs visualize:

- Dependencies
- Execution order
- Aggregation stages
- Parallel operations

---

## Distributed Processing

Architecture:

```text
Client
   ↓
Scheduler
   ↓
Workers
```

---

## Web Sockets

Web Sockets provide:

```text
Client ⇄ Server
```

communication using a persistent connection.

Benefits:

- Low latency
- Real-time updates
- Bidirectional communication

---

## Packet Transmission

Messages consist of:

```text
Header + Payload
```

Example:

```text
19        The time is 0.03125
```

---

# Challenges Encountered

## Graphviz Configuration

Task graph visualization required correcting the Graphviz executable path in the Jupyter environment.

### Resolution

Added the Graphviz binary directory to the notebook PATH.

---

## DASK CSV Type Inference

DASK produced dtype inference errors while reading CSV files.

### Resolution

Used:

```python
ddf.read_csv(
    "salary.csv",
    assume_missing=True
)
```

to resolve inconsistent datatype detection.

---

## Client-Server Communication

Port synchronization was required between streamServer.py and streamClient.py.

### Resolution

Updated both applications to use:

```text
Port 7000
```

---

# Real-World Applications

The concepts covered in Module 22 are commonly used in:

## Analytics Platforms

- Databricks
- Apache Spark
- Snowflake
- AWS Glue
- Azure Synapse

---

## Distributed Computing Platforms

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
- Driver monitoring
- Fuel event detection
- Geofence alerts

---

## Utility Analytics

Examples:

- Asset integrity analysis
- GIS processing
- Pipeline risk modeling
- Inspection analytics

---

# Key Takeaways

1. DASK enables scalable parallel and distributed computation in Python.
2. Apache Parquet and Feather improve storage efficiency for analytical workloads.
3. Partitioning and chunking are fundamental concepts in big data processing.
4. Task graphs help visualize distributed computations and dependencies.
5. Performance benchmarking reveals tradeoffs between NumPy, Pandas, and DASK.
6. Web Sockets support persistent, bidirectional communication.
7. Packet headers enable reliable message transmission and reconstruction.
8. Real-time streaming systems depend on efficient client-server communication.
9. Batch processing and streaming architectures often work together in production environments.
10. These concepts form a foundation for modern data engineering, analytics, and distributed systems.

---

# Module Deliverables

```text
Videos
Discussions
Knowledge_Checks
Coding_Activities
Final_Assignments
Resources
Cheat_Sheets
Sandbox
```

Each section contains supporting documentation, completed activities, summaries, screenshots, and reference materials that collectively document completion of Module 22.

---

# Conclusion

Module 22 provided practical experience with both large-scale data processing and real-time data streaming. Through DASK, I learned how to partition data, distribute workloads, and execute computations in parallel. Through Web Socket and socket-programming exercises, I gained hands-on experience implementing client-server communication and streaming packetized data.

The combination of distributed processing, benchmarking, task graph analysis, and real-time communication exercises established a strong foundation for understanding how modern data engineering systems process, analyze, and transmit data at scale.