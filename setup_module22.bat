@echo off

echo Creating Module 22 folder structure...

mkdir Videos

mkdir Knowledge_Checks

mkdir Discussions
mkdir Discussions\Discussion_22_1_Parallel_Computing
mkdir Discussions\Discussion_22_2_Web_Sockets

mkdir Coding_Activities
mkdir Coding_Activities\Coding_Activity_22_1_DASK_Create_Files
mkdir Coding_Activities\Coding_Activity_22_2_DASK_Analyze_Files
mkdir Coding_Activities\Coding_Activity_22_3_Distributed_Processing
mkdir Coding_Activities\Coding_Activity_22_4_Web_Socket_Streaming

mkdir Assignment
mkdir Assignment\Final_Assignment_22_1_Part_1
mkdir Assignment\Final_Assignment_22_1_Part_2

mkdir Resources
mkdir Cheat_Sheets
mkdir Sandbox

echo.
echo Creating starter files...

echo # Module 22 - Processing and Streaming Big Data > README.md

echo venv/ > .gitignore
echo __pycache__/>> .gitignore
echo .ipynb_checkpoints/>> .gitignore
echo *.pyc>> .gitignore
echo .env>> .gitignore

echo.
echo Folder structure created successfully!
echo.

tree /A /F

pause