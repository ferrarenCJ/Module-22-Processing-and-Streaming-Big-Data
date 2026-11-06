# Coding Activity 22.1: Using DASK to Create Multiple Files in Parallel

## Objective

The goal of this activity is to practice creating a Pandas DataFrame and using DASK to write the contents of the DataFrame into multiple files in parallel.

---

# Learning Outcome

Run parallel operations in DASK.

---

# Activity Summary

In this activity:

1. Installed the DASK library.
2. Opened the provided Activity_22_1.py file in VS Code.
3. Created a Pandas DataFrame containing odd and even numbers.
4. Converted the Pandas DataFrame into a DASK DataFrame.
5. Configured the DASK DataFrame to use two partitions.
6. Executed the code successfully.
7. Verified that DASK created two output files:
   - 0.part
   - 1.part
8. Validated the contents of each generated file.

---

# DataFrame Definition

The DataFrame contains two columns:

| odd_num | even_num |
|----------|----------|
| 1 | 2 |
| 3 | 4 |
| 5 | 6 |
| 7 | 8 |
| 9 | 10 |

Python code:

```python
import pandas as pd

pandas_df = pd.DataFrame({
    "odd_num": [1, 3, 5, 7, 9],
    "even_num": [2, 4, 6, 8, 10]
})
```

---

# DASK Conversion

The Pandas DataFrame was converted into a DASK DataFrame using two partitions.

```python
import dask.dataframe as dd

dask_df = dd.from_pandas(
    pandas_df,
    npartitions=2
)
```

---

# Output Files

The execution generated two partition files:

```text
0.part
1.part
```

Each partition contains a portion of the original DataFrame.

---

# Key Concepts Demonstrated

## DASK DataFrames

A DASK DataFrame is divided into partitions that can be processed independently.

---

## Parallel Processing

DASK executes partition operations concurrently across available CPU resources.

---

## Partitioning

The DataFrame was divided into two partitions:

```text
Partition 0
Partition 1
```

Each partition was written independently.

---

# Results

The program executed without errors and successfully produced multiple output files in parallel.

This activity demonstrated how DASK can simplify data partitioning and parallel file generation, which are common requirements in large-scale data engineering workflows.

---

# Conclusion

DASK provides an efficient way to process and write data in parallel. By partitioning a DataFrame into multiple segments, DASK can utilize available CPU resources more effectively and improve performance for large-scale data processing workloads.