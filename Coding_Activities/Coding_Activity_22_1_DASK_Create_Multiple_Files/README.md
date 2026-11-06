# Coding Activity 22.1: Using DASK to Create Multiple Files in Parallel

## Overview

In this activity, I practiced using the DASK library to perform parallel operations on a Pandas DataFrame. The objective was to create a DataFrame containing odd and even numbers, convert it into a DASK DataFrame with multiple partitions, and write the data into multiple output files in parallel.

This activity demonstrates how DASK partitions data and distributes work across independent tasks, allowing files to be generated simultaneously rather than sequentially.

---

# Learning Outcome

**Run parallel operations in DASK.**

---

# Activity Objectives

- Install and verify the DASK library.
- Create a Pandas DataFrame.
- Convert a Pandas DataFrame into a DASK DataFrame.
- Configure DASK partitions.
- Write partitioned data to multiple files.
- Verify the generated partition files.
- Examine the contents of each partition.

---

# Environment

## Operating System

```text
Windows
```

## Development Environment

```text
Visual Studio Code
```

## Python Environment

```text
Python Virtual Environment (venv)
```

## Required Libraries

```python
import pandas as pd
from dask import dataframe as dd
```

---

# Step 1: Install DASK

## Command

```cmd
pip install dask
```

## Result

The installation completed successfully and the terminal confirmed that DASK and its dependencies were available in the active virtual environment.

### Screenshot

```text
Step_1_DASK_Install.png
```

---

# Step 2: Open the Activity File

## File

```text
activity22_1.py
```

The provided file was opened successfully in Visual Studio Code.

### Screenshot

```text
Step_2_Open_File.png
```

---

# Step 3: Create the Pandas DataFrame

## Code

```python
pandas_df = pd.DataFrame({
    'odd_num': [1, 3, 5, 7, 9],
    'even_num': [2, 4, 6, 8, 10]
})

print(pandas_df)
```

## Output

```text
   odd_num  even_num
0        1         2
1        3         4
2        5         6
3        7         8
4        9        10
```

This DataFrame contains:

- All odd numbers from 1 to 10
- All even numbers from 1 to 10

### Screenshot

```text
Step_3_DataFrame.png
```

---

# Step 4: Create the DASK DataFrame

## Code

```python
df = dd.from_pandas(
    pandas_df,
    npartitions=2
)
```

## Explanation

The Pandas DataFrame was converted into a DASK DataFrame and divided into two partitions.

```text
Partition 0
Partition 1
```

Using multiple partitions enables DASK to process data in parallel.

### Screenshot

```text
Step_4_npartitions.png
```

---

# Step 5: Execute the Program

## Code

```python
df.to_csv(
    "C:/tmp/mo-pcde/activity22.1/",
    index=False
)
```

## Execution

The script was executed successfully without errors.

### Output

```text
   odd_num  even_num
0        1         2
1        3         4
2        5         6
3        7         8
4        9        10
```

### Screenshot

```text
Step_5_Run_Success.png
```

---

# Step 6: Verify Generated Files

## Output Directory

```text
C:\tmp\mo-pcde\activity22.1
```

## Generated Files

```text
0.part
1.part
```

DASK automatically created two files because the DataFrame was divided into two partitions.

### Screenshot

```text
Step_6_Output_Files.png
```

---

# Step 7A: Verify Contents of 0.part

## Command

```cmd
type C:\tmp\mo-pcde\activity22.1\0.part
```

## Output

```text
odd_num,even_num
1,2
3,4
5,6
```

## Explanation

The first partition contains the first three rows of the original DataFrame.

### Screenshot

```text
Step_7A_0_part.png
```

---

# Step 7B: Verify Contents of 1.part

## Command

```cmd
type C:\tmp\mo-pcde\activity22.1\1.part
```

## Output

```text
odd_num,even_num
7,8
9,10
```

## Explanation

The second partition contains the remaining rows from the original DataFrame.

### Screenshot

```text
Step_7B_1_part.png
```

---

# How DASK Partitioned the Data

Original DataFrame:

| odd_num | even_num |
|----------|----------|
| 1 | 2 |
| 3 | 4 |
| 5 | 6 |
| 7 | 8 |
| 9 | 10 |

### Partition 0

| odd_num | even_num |
|----------|----------|
| 1 | 2 |
| 3 | 4 |
| 5 | 6 |

### Partition 1

| odd_num | even_num |
|----------|----------|
| 7 | 8 |
| 9 | 10 |

---

# Key Concepts Demonstrated

## DASK DataFrames

DASK DataFrames extend Pandas functionality by allowing data to be partitioned and processed in parallel.

---

## Partitioning

The DataFrame was divided into:

```text
2 partitions
```

using:

```python
npartitions=2
```

---

## Parallel Processing

Rather than treating the entire DataFrame as a single unit, DASK breaks it into smaller pieces that can be processed independently.

---

## File Generation

Each partition was written to a separate file:

```text
0.part
1.part
```

This approach enables scalable data processing and is commonly used in large-scale ETL and analytics workflows.

---

# Results

The activity was completed successfully.

Accomplishments:

- Installed DASK.
- Created a Pandas DataFrame.
- Converted the DataFrame into a DASK DataFrame.
- Configured two partitions.
- Executed the script successfully.
- Generated partition output files.
- Verified the contents of each partition.

---

# Conclusion

In this activity, I used DASK to partition a Pandas DataFrame and write the data into multiple files in parallel. The DataFrame was divided into two partitions using the `npartitions=2` argument, which resulted in the creation of two output files: `0.part` and `1.part`. This exercise demonstrated the fundamental concepts of DASK DataFrames, partitioning, and parallel processing.

These same concepts are widely used in modern data engineering platforms such as Apache Spark, Databricks, AWS Glue, and other distributed computing systems where large datasets are processed and written efficiently across multiple partitions.