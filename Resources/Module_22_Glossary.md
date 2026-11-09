# Module 22: Glossary

## Overview

This glossary contains the key terms and concepts introduced in Module 22, which focused on processing and streaming big data using DASK, Apache Parquet, Apache Feather, parallel computing, and Web Sockets.

---

# A

## Automatic Parallelization

The technique of transforming sequential code into multi-threaded code. This process is typically handled by a compiler and is commonly used on CPU cores with shared memory.

---

# C

## Checkpoints

A technique used in parallel computing that allows a thread to return to a previously saved state if an unknown variable state causes execution to become stuck.

---

## Close Frame

In Web Sockets, a close frame indicates that either the client or server wants to terminate the connection.

---

## Core

Within a CPU, a core is the processing unit responsible for executing instructions and processing information.

---

# D

## DASK

An open-source Python library designed to perform parallel and distributed computations.

---

## dask-worker

A DASK worker is a process responsible for executing tasks assigned by the DASK scheduler.

---

## DASK Task Graph

A visual representation of DASK computations powered by Graphviz. Task graphs illustrate how operations are divided into tasks and distributed across workers and processors.

---

## dask-scheduler

The coordinating process responsible for managing and assigning tasks to DASK workers.

---

# F

## Feather Format

A columnar storage format developed by the Apache Software Foundation. Feather is optimized for extremely fast read and write operations and is commonly used for short-term storage and data exchange.

---

## Frame

In the Web Socket protocol, a frame contains message data and any additional information needed for communication between endpoints.

---

# G

## Graphic Processing Unit (GPU)

An electronic processor originally designed to accelerate graphics rendering. GPUs are now widely used for computationally intensive workloads such as machine learning and parallel processing.

---

## Graphviz

An open-source visualization library used to create diagrams and visualize structured information such as DASK task graphs.

---

# I

## Internet of Things (IoT)

A network of internet-connected devices that collect, exchange, and analyze data.

---

# L

## Locks

A synchronization mechanism used in parallel computing that prevents multiple threads from accessing the same resource simultaneously.

---

## Long Polling

A communication technique where a client maintains an HTTP request for an extended period while waiting for the server to provide data. Long polling is often used for near real-time communication but is generally less efficient than Web Sockets.

---

# M

## Masking Key

A value used in Web Socket communications to help prevent messages exchanged between endpoints from being altered or disrupted.

---

## Memory Bus

An electronic communication pathway that transfers information among CPUs and memory components during computing operations.

---

# O

## Operation Code (Opcode)

A field within a Web Socket frame that specifies how the payload data should be interpreted.

---

# P

## Parallel Computing

A software and hardware approach that allows multiple computations to be executed simultaneously.

---

## Parallel Processing

The process of breaking a large problem into multiple smaller tasks that can be executed concurrently by different processors.

---

## Parallel Programming Languages

Programming languages and frameworks that support multi-threading and parallel execution. Some implementations use shared memory while others rely on message passing between distributed systems.

---

## Parquet Format

An open-source columnar storage format commonly used in big data analytics. Parquet improves storage efficiency and analytical query performance through column-based storage and compression.

---

## Packets

Small chunks of data transmitted between a server and client through the Transmission Control Protocol (TCP).

---

## Ping Frame

A Web Socket control frame used to verify that a connection is still active. A ping frame expects a pong response.

---

## Pong Frame

A response frame sent after receiving a ping frame to confirm that a Web Socket connection remains active.

---

# R

## Race Condition

A problem that occurs when multiple threads attempt to read from and write to the same memory location simultaneously, potentially producing inconsistent results.

---

## Register

A physical memory location within a CPU used for storing and processing data during execution.

---

## Resource Consumption

The act of accessing a memory resource during processing. Resources are often protected through locks to prevent simultaneous access conflicts.

---

# S

## Semaphores

Synchronization mechanisms used to signal and coordinate activity among multiple threads.

---

## Sequential Computing

A computing model where instructions are executed one at a time in a predefined order.

---

## Sleeping

A process in which a thread is temporarily suspended while waiting for a resource or lock, reducing unnecessary CPU utilization.

---

# T

## Task

A smaller unit of work created by dividing a larger computational problem into manageable pieces.

---

## Time Slicing

A scheduling technique that specifies how long a thread is allowed to execute before CPU time is reassigned.

---

## Transmission Control Protocol (TCP)

A network communication protocol that provides reliable communication between applications over IP networks.

---

# W

## Wall Time

The total elapsed real-world time required to execute a program or process.

---

## Web Sockets

A persistent, bidirectional communication protocol that allows clients and servers to exchange data continuously over a single TCP connection.

---

## Wildcard

A special character, commonly represented with an asterisk (`*`), used to match patterns such as file names or file groups.

---

# Key Concepts by Topic

## Parallel Computing

- Automatic Parallelization
- Checkpoints
- Core
- dask-worker
- dask-scheduler
- Locks
- Memory Bus
- Parallel Computing
- Parallel Processing
- Race Condition
- Registers
- Resource Consumption
- Semaphores
- Sequential Computing
- Sleeping
- Task
- Time Slicing

---

## Big Data Processing

- DASK
- DASK Task Graph
- Feather Format
- Graphviz
- Parquet Format
- Wildcard

---

## Web Sockets and Streaming

- Close Frame
- Frame
- Long Polling
- Masking Key
- Opcode
- Packets
- Ping Frame
- Pong Frame
- TCP
- Web Sockets

---

## Modern Data Engineering Applications

These concepts are commonly used in:

- Apache Spark
- Databricks
- DASK
- AWS Glue
- AWS Kinesis
- Azure Event Hubs
- Apache Kafka
- Real-time dashboards
- Fleet telemetry systems
- IoT platforms
- Streaming analytics pipelines

---

# Key Takeaways

1. DASK provides scalable parallel and distributed computing capabilities within Python.
2. Parquet and Feather are optimized storage formats for analytical workloads.
3. Parallel computing increases performance by dividing work into smaller tasks.
4. Race conditions, locks, and semaphores are important concepts in concurrent processing.
5. Web Sockets provide persistent, bidirectional communication between clients and servers.
6. TCP packets form the foundation of network communication and data streaming.
7. Task graphs help visualize and understand distributed computations.
8. These concepts collectively support modern big data processing and real-time analytics architectures.