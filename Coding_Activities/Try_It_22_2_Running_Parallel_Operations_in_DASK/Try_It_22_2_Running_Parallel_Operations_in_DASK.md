# Required Try-It Activity 22.2: Running Parallel Operations in DASK

## Objective

In this activity, I explored how DASK can execute operations in parallel and compared its performance against traditional sequential processing. By running the same computations using both approaches, I was able to observe how parallel processing improves execution efficiency and resource utilization.

---

## Discussion Questions

### 1. Do you observe any time differences between running threads sequentially and in parallel?

Yes. There was a noticeable difference in execution time between sequential and parallel execution. In the sequential version, each function call had to complete before the next one could begin. As a result, the total runtime was approximately the sum of all individual operations.

When DASK was used with the `delayed()` function, independent tasks were executed simultaneously across available CPU resources. Because multiple operations could run at the same time, the overall runtime was reduced. The improvement became even more noticeable as the number of tasks increased.

---

### 2. Are there any performance gains when running threads in parallel? If so, describe those benefits in detail.

Yes, running tasks in parallel produced clear performance gains. The primary benefit was reduced execution time because DASK was able to schedule independent tasks concurrently instead of processing them one at a time.

Additional benefits include:

- Better utilization of available CPU cores.
- Increased scalability when working with larger workloads.
- Reduced waiting time when multiple independent operations must be performed.
- Improved efficiency for data processing, analytics, and ETL workloads.
- Ability to process larger datasets without significantly increasing execution times.

DASK automatically builds a task graph, determines which operations can run simultaneously, and schedules those tasks efficiently. This approach minimizes idle CPU time and maximizes throughput.

---

### 3. Why is it necessary to implement parallel operations when working with large data files?

Parallel operations are essential when working with large datasets because modern data volumes can easily contain millions or billions of records. Processing these records sequentially often results in long execution times and inefficient use of hardware resources.

By partitioning data into smaller chunks and processing those chunks simultaneously, parallel computing can significantly reduce runtime. This approach allows organizations to analyze large datasets more quickly, improve productivity, and generate insights faster.

Many modern data engineering platforms rely heavily on parallel processing, including:

- DASK
- Apache Spark
- Databricks
- AWS Glue
- Snowflake

These platforms distribute work across multiple CPU cores or multiple machines so that large-scale analytics can be performed efficiently. As data volumes continue to grow, parallelization becomes a critical technique for maintaining acceptable performance and enabling scalable data processing solutions.

---

## Key Takeaway

This activity demonstrated that parallel computing can provide substantial performance improvements compared to sequential execution. DASK simplifies this process by automatically creating task graphs, scheduling independent tasks, and leveraging available computing resources to execute workloads more efficiently. These capabilities make DASK an effective tool for processing large datasets and a valuable introduction to distributed computing concepts used throughout modern data engineering platforms.