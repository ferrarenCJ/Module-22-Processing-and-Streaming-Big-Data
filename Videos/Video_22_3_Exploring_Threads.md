# Video 22.3: Exploring Threads (06:23)

## Overview

In this video, Dr. Williams explores how modern computers use multiple CPU cores to execute programs using multiple threads. Threads enable different parts of a program to run simultaneously, allowing computers to process workloads more efficiently through parallel execution.

Understanding threads is essential for learning parallel computing concepts and for working with tools such as **DASK**, which leverage multiple CPU cores to accelerate data processing.

---

# What is a CPU Core?

A CPU (Central Processing Unit) is the component responsible for executing program instructions.

Modern processors contain multiple cores.

Example:

```text
Single-Core CPU

CPU
 └── Core 1
```

```text
Multi-Core CPU

CPU
 ├── Core 1
 ├── Core 2
 ├── Core 3
 └── Core 4
```

Each core can independently execute instructions.

Benefits:

- Faster execution
- Better multitasking
- Improved efficiency
- Greater parallelism

---

# What is a Thread?

A thread is the smallest unit of execution within a process.

A single application can create multiple threads that run concurrently.

Example:

```text
Application
     │
     ├── Thread 1
     ├── Thread 2
     ├── Thread 3
     └── Thread 4
```

Each thread may perform a different task while contributing to the same overall program.

---

# Process vs Thread

## Process

A process is a running application.

Examples:

- Python
- Microsoft Excel
- Google Chrome
- VS Code

Each application runs as a process.

---

## Thread

A thread is an execution path inside a process.

Example:

```text
Process: Google Chrome

├── Rendering Thread
├── Network Thread
├── UI Thread
└── Background Thread
```

Multiple threads can exist within a single process.

---

# Single-Threaded Execution

Traditional execution:

```text
Task A
   ↓
Task B
   ↓
Task C
   ↓
Task D
```

Only one instruction path is active at a time.

Characteristics:

✅ Simple

✅ Predictable

❌ Slower for large workloads

---

# Multi-Threaded Execution

Multiple tasks execute concurrently.

```text
Thread 1 → Task A

Thread 2 → Task B

Thread 3 → Task C

Thread 4 → Task D
```

Characteristics:

✅ Faster execution

✅ Better resource utilization

✅ Improved responsiveness

---

# How Threads Use Multiple CPU Cores

Modern operating systems distribute threads across available CPU cores.

Example:

```text
CPU Core 1 → Thread 1

CPU Core 2 → Thread 2

CPU Core 3 → Thread 3

CPU Core 4 → Thread 4
```

Threads can execute simultaneously, reducing total processing time.

---

# Thread Priorities

Not all threads are equally important.

Operating systems can assign priorities.

Example:

```text
High Priority:
    User Interface

Medium Priority:
    Calculations

Low Priority:
    Background Updates
```

The scheduler allocates CPU time based on thread priority.

Benefits:

- Improved responsiveness
- Better user experience
- Efficient resource utilization

---

# Why Threads Improve Performance

Consider processing four files.

### Single Thread

```text
File 1
File 2
File 3
File 4
```

Execution Time:

```text
T1 + T2 + T3 + T4
```

---

### Four Threads

```text
Thread 1 → File 1

Thread 2 → File 2

Thread 3 → File 3

Thread 4 → File 4
```

Execution Time:

```text
Longest Individual Task
```

Potentially reducing runtime significantly.

---

# Real-World Examples of Threads

## Web Browser

When multiple tabs are open:

```text
Tab 1 → Thread
Tab 2 → Thread
Tab 3 → Thread
```

Each tab can operate independently.

---

## Video Streaming

Threads may handle:

```text
Download Video Data

Decode Video

Play Audio

Render Video
```

Simultaneously.

---

## Data Engineering

Threads can be used to:

```text
Read Files

Transform Data

Write Results

Generate Reports
```

at the same time.

This is a core concept behind DASK.

---

# Threads and Parallel Computing

Threads are one of the mechanisms that enable parallel computing.

Workflow:

```text
Large Problem
       ↓
Split Into Tasks
       ↓
Create Threads
       ↓
Assign Tasks To Threads
       ↓
Execute Simultaneously
```

This allows modern hardware to process large workloads efficiently.

---

# Threads in Python

Python provides several approaches to threading.

Example:

```python
import threading

def task():
    print("Running")

thread = threading.Thread(target=task)

thread.start()
```

This creates and starts a new thread.

---

# Threads and DASK

DASK uses task scheduling and thread pools to execute workloads in parallel.

Example:

```python
import dask.dataframe as dd

df = dd.read_csv("data/*.csv")
```

DASK automatica*ly distributes operations across a*ailable CPU resources.

Benefits:
*- Faster execution
- Parallel file*processing
- Better scalability

-*-

# Advantages of Multi-Threading*
### Performance*
Multiple tasks execute simultaneo*sly.

---

### Responsiveness

Pro*rams remain interactive while back*round work continues.

---

### Be*ter Hardware Utilization

Modern C*Us contain multiple cores.

Thread* help utilize those resources effe*tively.

---

### Scalability

Lar*e workloads can be broken into man*geable tasks.

---

# Challenges o* Threads

Multi-threading is power*ul but introduces complexity.

Pot*ntial problems include:

### Race *onditions

Two threads accessing t*e same resource simultaneously.

-*-

### Deadlocks

Multiple threads*waiting indefinitely for each othe*.

---

### Resource Contention

T*reads competing for memory, files,*or CPU resources.

These challenge* require synchronization technique* such as:

- Locks
- Semaphores
- *ueues
- Task schedulers

---

# Ke* Takeaways

1. Modern CPUs contain*multiple processing cores.
2. Thre*ds are individual execution paths *nside a process.
3. Multiple threa*s can execute simultaneously on di*ferent CPU cores.
4. Multi-threadi*g improves performance and respons*veness.
5. Operating systems assig* priorities to threads.
6. Threads*are a foundational concept in para*lel computing.
7. DASK leverages t*reads to accelerate data processin*.
8. Multi-threaded applications m*st manage synchronization carefull* to avoid race conditions and dead*ocks.

---

# Personal Notes

### *ata Engineering Perspective

Threa*s form the foundation of modern pa*allel data processing frameworks.
*Examples include:

- DASK
- Apache*Spark
- Ray
- Databricks
- AWS Glu*

A typical workflow may look like*

```text
100 CSV Files
      ↓
10* Parallel Tasks
      ↓
Multiple W*rker Threads
      ↓
Combined Resu*ts
```

Instead of processing ever* file sequentially, threads enable*multiple files to be read, transfo*med, and analyzed concurrently. Th*s dramatically reduces execution t*me and is one of the reasons frame*orks such as DASK are widely used *or big data workloads.