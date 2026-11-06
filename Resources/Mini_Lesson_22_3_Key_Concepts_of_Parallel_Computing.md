# Mini-Lesson 22.3: Key Concepts of Parallel Computing

## Overview

In this section, you will learn the fundamentals of parallel computing and understand how it differs from traditional sequential computing. You will explore the concepts that make large-scale data processing possible and prepare for working with **DASK**, a Python library designed for parallel and distributed computing.

Key topics include:

- Sequential computing
- Parallel processing
- Parallel computing
- Threads
- Multi-core processors
- Distributed computing
- Race conditions
- Synchronization techniques
- Fault tolerance

These concepts form the foundation of modern big data systems and distributed analytics platforms.

---

# Sequential Computing

Traditional computing follows a **sequential execution model**.

In this model, instructions are executed one at a time in a specific order.

Process:

```text
Fetch Instruction
        ↓
Decode Instruction
        ↓
Execute Instruction
        ↓
Read Memory
        ↓
Write Result
```

Each instruction must wait for the previous instruction to complete.

---

## Example of Sequential Computing

Suppose a program must process four files:

```text
File A
File B
File C
File D
```

The CPU processes:

```text
File A → Complete
File B → Complete
File C → Complete
File D → Complete
```

Total Processing Time:

```text
A + B + C + D
```

As datasets grow larger, this approach becomes increasingly inefficient.

---

# Parallel Processing

Parallel processing breaks a large task into smaller independent tasks.

Instead of using a single processor:

```text
Processor 1
```

multiple processors work simultaneously:

```text
Processor 1 → Task A
Processor 2 → Task B
Processor 3 → Task C
Processor 4 → Task D
```

Total Processing Time becomes approximately:

```text
Longest Individual Task
```

instead of:

```text
Task A + Task B + Task C + Task D
```

---

# How Parallel Processing Works

A large problem is divided into smaller tasks.

Example:

```text
Large Dataset
       ↓
Split into Tasks
       ↓
Task A
Task B
Task C
Task D
       ↓
Multiple CPUs Execute Simultaneously
```

Each processor works independently before results are combined.

---

# Shared Memory

In many parallel systems, all processors share the same memory.

```text
CPU 1
CPU 2
CPU 3
CPU 4
   ↓
Shared Memory
```

Because all processors access the same memory resources, coordination is required to prevent conflicts.

---

# What is a Thread?

A thread is a single execution path responsible for processing a specific task.

Example:

```text
Program
   │
   ├── Thread 1
   ├── Thread 2
   ├── Thread 3
   └── Thread 4
```

Each thread performs part of the overall workload.

---

## Example

Analyzing four files:

```text
Thread 1 → data1.csv
Thread 2 → data2.csv
Thread 3 → data3.csv
Thread 4 → data4.csv
```

All files can be processed simultaneously.

---

# Parallel Processing vs Parallel Computing

Although the terms are often used interchangeably, they have different meanings.

## Parallel Processing

The hardware concept.

Focus:

```text
Breaking large work into smaller tasks
```

and running them simultaneously.

---

## Parallel Computing

The software concept.

Focus:

```text
Coordinating
Managing
Scheduling
Executing
```

parallel workloads using software.

---

### Simple Rule

```text
Parallel Processing = Hardware

Parallel Computing = Software
```

Both must work together for efficient execution.

---

# Why Parallel Computing Matters

Modern devices contain multiple CPU cores.

Examples:

- Laptops
- Smartphones
- Tablets
- Servers
- Cloud infrastructure

Instead of leaving hardware idle, parallel computing utilizes those resources.

Benefits:

✅ Faster execution

✅ Better CPU utilization

✅ Increased scalability

✅ Reduced processing time

✅ Improved energy efficiency

---

# Levels of Parallel Computing

There are four major levels of parallelism.

---

## 1. Bit-Level Parallelism

Increasing the number of bits processed per instruction.

Example:

```text
32-bit CPU
64-bit CPU
```

A 64-bit processor can process more information per instruction.

Benefit:

- Reduced instruction count

---

## 2. Instruction-Level Parallelism

The processor determines which instructions can execute simultaneously.

Example:

```text
Instruction A
Instruction B
```

may be executed at the same time if they are independent.

Benefit:

- Improved CPU efficiency

---

## 3. Task-Level Parallelism

Multiple processors execute different tasks simultaneously.

Example:

```text
Processor 1 → Task A
Processor 2 → Task B
Processor 3 → Task C
Processor 4 → Task D
```

This is the type of parallelism most commonly used by:

- DASK
- Spark
- Hadoop

---

## 4. SuperWord-Level Parallelism

Uses vectorized operations to process multiple data values in a single instruction.

Example:

```python
numpy.array([1,2,3]) + 5
```

Vectorization can execute many calculations simultaneously.

Benefit:

- Faster mathematical operations

---

# Potential Problems in Parallel Computing

Parallel programming introduces complexity.

---

## Race Conditions

A race condition occurs when multiple threads attempt to access the same resource simultaneously.

Example:

```text
Thread A reads variable X

Thread B modifies variable X

Thread A continues using outdated value
```

Results become unpredictable.

---

## Why Race Conditions Are Dangerous

They may cause:

- Incorrect calculations
- Inconsistent outputs
- Program crashes
- Data corruption

Race conditions are especially common when:

- Reading files
- Writing files
- Updating variables
- Accessing shared memory

---

# Solutions for Parallel Computing

Several techniques have been developed to reduce errors and improve reliability.

---

## Checkpoints

Checkpoints periodically save program state.

Example:

```text
Checkpoint 1
Checkpoint 2
Checkpoint 3
```

If a failure occurs:

```text
Resume from latest checkpoint
```

rather than restarting the entire process.

Benefits:

- Fault tolerance
- Faster recovery

---

## Automatic Parallelization

Compilers automatically convert sequential code into parallel code.

Example:

```text
Sequential Code
       ↓
Compiler
       ↓
Multi-threaded Execution
```

Benefit:

- Easier development

---

## Parallel Programming Languages

Some languages provide explicit support for parallel execution.

Common examples:

- Python
- C++
- Java
- CUDA

These languages allow developers to manually manage threads and parallel workloads.

---

## Locks and Semaphores

Used to prevent race conditions.

### Lock

A lock temporarily prevents other threads from accessing a resource.

Example:

```text
Thread 1 acquires lock
       ↓
Uses resource
       ↓
Releases lock
```

Other threads must wait.

---

### Semaphore

A signaling mechanism used to coordinate threads.

Example:

```text
Thread A signals completion

Thread B begins execution
```

Semaphores help coordinate complex workflows.

---

## Sleeping

If a thread is waiting for a resource, it can be placed into a sleep state.

Example:

```text
Waiting for lock
       ↓
Sleep
       ↓
Wake when available
```

Benefits:

- Reduced CPU usage
- Reduced power consumption
- Better efficiency

---

# Parallel Computing and DASK

DASK is a Python library that uses parallel computing principles to process large datasets efficiently.

DASK can:

- Read multiple files simultaneously
- Write multiple files simultaneously
- Distribute tasks across CPU cores
- Scale across multiple machines
- Process datasets larger than memory

Example:

```python
import dask.dataframe as dd

df = dd.read_csv("data/*.csv")
```

DASK automatically spl*ts the workload across available r*sources.

---

# Key Takeaways

1.*Sequential computing executes inst*uctions one at a time.
2. Parallel*processing divides work among mult*ple processors.
3. Threads are sma*ler execution units that perform s*ecific tasks.
4. Parallel processi*g focuses on hardware execution.
5* Parallel computing focuses on sof*ware coordination.
6. Multi-core processors make parallel execution possible.
7. Race conditions occur when multiple threads access shared resources simultaneously.
8. Locks and semaphores help prevent synchronization issues.
9. Checkpoints improve fault tolerance.
10. DASK uses parallel computing techniques to accelerate big data processing.

---

# Personal Notes

### Data Engineering Perspective

Most modern data engineering platforms rely heavily on parallel computing.

Examples:

- Apache Spark
- DASK
- Hadoop
- Databricks
- Snowflake
- AWS Glue

A typical workflow:

```text
Large Dataset
      ↓
Partition Data
      ↓
Multiple Workers
      ↓
Parallel Processing
      ↓
Combined Results
```

Without parallel computing, processing terabytes or petabytes of data would be impractical. Technologies such as DASK make it possible to leverage the multiple CPU cores available on modern machines while maintaining a familiar Python interface.