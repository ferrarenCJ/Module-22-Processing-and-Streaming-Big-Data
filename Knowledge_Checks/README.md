# Module 22 Knowledge Checks

## Overview

The knowledge checks in Module 22 reinforced the core concepts covered throughout the lessons on big data processing, parallel computing, DASK, distributed systems, and Web Sockets. These activities provided opportunities to review terminology, validate understanding, and apply concepts before completing the coding activities and final assignments.

The knowledge checks focused on both conceptual understanding and practical application of Module 22 topics.

---

# Learning Objectives Reinforced

The knowledge checks helped reinforce the ability to:

- Understand parallel computing concepts.
- Identify components of distributed systems.
- Explain DASK architecture.
- Recognize advantages of Parquet and Feather formats.
- Understand thread execution and race conditions.
- Explain Web Socket communication.
- Identify packet transmission concepts.
- Differentiate between HTTP and Web Socket communication.

---

# Knowledge Check Activity: Parallel Computing and Web Sockets

## Overview

This activity reviewed many of the key terms and concepts introduced throughout the module using a drag-and-drop exercise.

The objective was to complete statements about:

- Sequential computing
- Parallel computing
- Threads
- Race conditions
- Web Sockets
- TCP communication
- Long polling
- Packet transmission

---

# Topics Covered

## Sequential Computing

Reviewed how traditional systems process instructions.

Key Concepts:

- Compiler
- Machine-language instructions
- Central Processing Unit (CPU)
- Sequential execution

Example:

```text
Fetch
   ↓
Decode
   ↓
Execute
```

---

## Parallel Computing

Reviewed how large computational workloads are divided into smaller tasks.

Key Concepts:

- Tasks
- Processors
- Parallel execution
- Energy efficiency

Benefits:

- Faster execution
- Improved scalability
- Better resource utilization

---

## Threading

Reviewed how multiple threads execute within a process.

Key Concepts:

```text
Thread
Lock
Semaphore
```

Understanding thread behavior is important for preventing execution conflicts in parallel environments.

---

## Race Conditions

The activity reinforced the concept of race conditions.

Definition:

A race condition occurs when multiple threads access the same memory location simultaneously while at least one thread modifies the data.

Example:

```text
Thread A → Read Variable

Thread B → Write Variable
```

Potential Result:

```text
Unexpected Output
Data Corruption
```

---

## Web Sockets

Reviewed persistent communication between clients and servers.

Key Concepts:

```text
Client
Server
Connection
```

Benefits:

- Low latency
- Real-time communication
- Continuous connectivity

---

## HTTP vs Web Sockets

### HTTP

```text
Client Request
       ↓
Server Response
       ↓
Connection Ends
```

Characteristics:

- Unidirectional
- Request/response model

---

### Web Sockets

```text
Client ⇄ Server
```

Characteristics:

- Bidirectional
- Persistent connection
- Real-time communication

---

## Long Polling

Reviewed one of the techniques used before Web Sockets became common.

Workflow:

```text
Client Request
       ↓
Server Waits
       ↓
Push Data
       ↓
Client Reconnects
```

Limitations:

- Higher overhead
- Additional server resources

---

## Streaming Data

The activity reviewed packet-based communication.

Key Concepts:

```text
Header
Payload
```

Example:

```text
19        The time is 0.03125
```

Where:

```text
19
```

represents message length and:

```text
The time is 0.03125
```

represents the transmitted data.

---

# Key Terms Reviewed

| Term | Description |
|--------|--------|
| Compiler | Converts human-readable code into machine instructions |
| Machine Language | CPU-executable instructions |
| CPU | Central Processing Unit |
| Task | Unit of work in parallel computing |
| Thread | Unit of execution |
| Race Condition | Memory conflict between threads |
| Bidirectional | Two-way communication |
| HTTP | Request-response communication protocol |
| Long Polling | Long-lived HTTP request |
| Push | Server-initiated message transmission |
| Connection | Communication channel between systems |
| Web Socket | Persistent TCP communication channel |
| Path | URL routing component |
| Extension | Protocol extension such as ws:// or wss:// |

---

# Concepts Reinforced

## Parallel Computing

Topics:

- Tasks
- Threads
- Resource management
- Multi-core processing

---

## Distributed Systems

Topics:

- DASK
- Scheduling
- Workload distribution
- Task execution

---

## Communication Protocols

Topics:

- HTTP
- TCP
- Web Sockets

---

## Streaming Architectures

Topics:

- Message framing
- Packets
- Persistent connections
- Client-server communication

---

# Practical Relevance

The concepts reviewed in the knowledge checks are commonly used in:

## Data Processing Platforms

- DASK
- Apache Spark
- Databricks
- AWS Glue

---

## Streaming Platforms

- Apache Kafka
- AWS Kinesis
- Azure Event Hubs
- RabbitMQ

---

## Real-Time Applications

- Stock trading platforms
- Fleet management systems
- IoT telemetry systems
- GPS tracking systems
- Monitoring dashboards

---

# Key Takeaways

1. Parallel computing divides work into smaller tasks that execute concurrently.
2. Threads enable multiple operations to execute within a process.
3. Race conditions can occur when threads access shared resources simultaneously.
4. Web Sockets enable persistent, bidirectional communication.
5. HTTP uses a request-response model and is generally unidirectional.
6. Long polling was an early approach for near real-time communication.
7. Packet transmission relies on headers and payloads.
8. Streaming architectures depend on reliable client-server communication.

---

# Conclusion

The Module 22 knowledge checks provided a valuable review of the key concepts introduced throughout the module. The activities reinforced understanding of parallel computing, thread management, race conditions, Web Sockets, TCP communication, and streaming architectures. These concepts formed the foundation for the coding activities and final assignments and helped strengthen my understanding of modern distributed systems and real-time data processing.