# Module 22: Introduction and Information (Video 22.1)

## Welcome to Module 22: Processing and Streaming Big Data

In this module, you will explore techniques for processing and streaming big data using Python and several industry-standard technologies. The module begins with an examination of large-scale data processing using the **pandas** library and two high-performance file formats: **Apache Parquet** and **Apache Feather**.

You will compare the functionality and performance of Parquet and Feather when working with large datasets and learn when each format is most appropriate.

The module then introduces **parallel computing** concepts and **DASK**, a Python library that enables parallel and distributed data processing. You will gain hands-on experience using DASK to:

- Create files in parallel
- Read files in parallel
- Write files in parallel
- Analyze large datasets efficiently
- Simulate processing across distributed machines

In the second half of the module, you will learn about **Web Sockets**, a communication protocol that enables real-time, bidirectional data transfer between systems. You will use Web Sockets to stream data and build simple streaming applications.

---

## Final Assignment Overview

The final assignment consists of two parts:

### Part 1: Parallel Computing Performance Comparison

You will compare the performance of:

- pandas
- NumPy
- DASK

and evaluate how parallel computing affects execution speed and efficiency when processing large datasets.

### Part 2: Data Streaming with Web Sockets

You will create a basic streaming application using Web Sockets and practice sending and receiving real-time data.

---

# Video 22.1: Introduction (04:10)

In this introductory video, Dr. Williams provides an overview of the module and introduces the key technologies and concepts that will be covered.

Topics include:

- Processing large datasets
- Apache Feather format
- Apache Parquet format
- Parallel computing fundamentals
- DASK
- Multi-core processing
- Big data analytics
- Web Socket data streaming

The video explains how modern computers utilize multiple CPU cores and how DASK can leverage those cores to execute tasks simultaneously, reducing processing time and improving performance for large-scale workloads.

---

# Key Concepts Introduced

## Apache Parquet

A columnar storage format designed for analytics workloads.

Benefits:

- Efficient compression
- Faster analytical queries
- Reduced storage requirements
- Widely used in data lakes and cloud platforms

Commonly used with:

- Apache Spark
- DASK
- AWS Athena
- AWS Glue
- Azure Synapse
- Databricks

---

## Apache Feather

A lightweight binary storage format optimized for fast data transfer between applications.

Benefits:

- Extremely fast read/write performance
- Efficient exchange of data between Python processes
- Useful for local analytics workflows

---

## DASK

A Python library for parallel and distributed computing.

Capabilities:

- Parallel execution across CPU cores
- Distributed execution across multiple machines
- Processing datasets larger than memory
- Scalable DataFrame operations similar to pandas

Common use cases:

- Big data processing
- ETL pipelines
- Machine learning preprocessing
- Large-scale analytics

---

## Parallel Computing

Parallel computing allows multiple tasks to run simultaneously rather than sequentially.

### Sequential Processing

```text
Task A
Task B
Task C
Task D
```

### Parallel Processing

```text
Core 1 → Task A
Core 2 → Task B
Core 3 → Task C
Core 4 → Task D
```

Benefits:

- Faster execution
- Better resource utilization
- Improved scalability

---

## Web Sockets

A communication protocol that maintains an open connection between client and server.

Unlike traditional HTTP:

```text
Client → Request
Server → Response
Connection Closed
```

Web Sockets provide:

```text
Client ↔ Server
```

allowing real-time two-way communication.

Common applications:

- Live dashboards
- Chat applications
- GPS tracking systems
- Financial market feeds
- IoT device monitoring
- Real-time analytics

---

# Module Learning Outcomes

By the end of this module, you will be able to:

1. Compare applications of the Parquet and Feather formats for reading and writing big data.
2. Run parallel operations in DASK.
3. Discuss use cases for parallel computing.
4. Identify key concepts of DASK and parallel computing.
5. Discuss use cases of Web Sockets.
6. Stream data through Web Sockets.

---

# Personal Notes

### Why This Module Matters

This module introduces two foundational modern data engineering capabilities:

1. **Big Data Processing**
   - Efficient storage formats
   - Parallel computing
   - Distributed computation

2. **Real-Time Data Streaming**
   - Event-driven architecture
   - Low-latency communication
   - Real-time analytics

These concepts are widely used across modern data platforms such as:

- AWS Data Engineering Services
- Databricks
- Apache Spark
- Kafka ecosystems
- Fleet monitoring systems
- Utility telemetry systems
- IoT architectures

Together, DASK and Web Sockets provide the foundation for building scalable systems that can both process large volumes of historical data and stream real-time operational data.