# Final Assignment 22.1 (Part 2): Processing and Streaming Big Data

## Overview

This assignment focused on implementing real-time communication using Python sockets and Web Socket concepts. A client-server application was configured to establish a persistent connection, stream messages between applications, and demonstrate packet creation using message headers.

The assignment reinforced the foundational concepts of network communication, packet transmission, and real-time data streaming that support modern Web Socket-based applications.

---

# Learning Outcome

Stream data through Web Sockets.

---

# Assignment Summary

The assignment required configuring and testing a socket-based server and client application.

### Activities Completed

- Downloaded and extracted the Assignment22_2 project files.
- Modified the server port to use port 7000.
- Started the socket server.
- Updated the server application to use the `time.thread_time()` function.
- Modified the client application to connect using port 7000.
- Established communication between the client and server.
- Streamed packets from the server to the client.
- Verified message transmission and reception.

---

# Technologies Used

## Python

Used to implement both server and client applications.

---

## Socket Library

```python
import socket
```

Used to:

- Create server connections
- Create client connections
- Transmit messages
- Receive packets

---

## Time Library

```python
import time
```

Used to generate thread timing information through:

```python
time.thread_time()
```

---

# Server Configuration

## Port Modification

The server connection was updated to use:

```text
7000
```

### Configuration

```python
ws.bind(
    (socket.gethostname(), 7000)
)
```

---

## Thread Timing Modification

The server message generation logic was updated to use:

```python
time.thread_time()
```

### Configuration

```python
msg = f"The time is {time.thread_time()}"
```

This function returns the CPU time consumed by the current thread.

---

# Client Configuration

The client application was modified to connect to:

```text
Port 7000
```

### Configuration

```python
ws.connect(
    (socket.gethostname(), 7000)
)
```

This allowed communication with the modified server application.

---

# Communication Workflow

## Server

```text
Start Server
      ↓
Listen on Port 7000
      ↓
Wait for Client
      ↓
Generate Messages
      ↓
Add Packet Header
      ↓
Send Packets
```

---

## Client

```text
Start Client
      ↓
Connect to Server
      ↓
Receive Packet
      ↓
Read Header
      ↓
Extract Message
      ↓
Display Output
```

---

# Packet Structure

Messages were transmitted using:

```text
Header + Message
```

Example:

```text
19        The time is 0.03125
```

Where:

```text
19
```

represents the message length and:

```text
The time is 0.03125
```

represents the payload.

---

# Results

## Client

Successfully received streamed messages from the server.

Example:

```text
M:19 The time is 0.03125
```

---

## Server

Successfully accepted the client connection.

Example:

```text
Connect from ('192.168.1.47', 58047) established
```

The server continuously transmitted packetized messages to the connected client.

---

# Screenshots Included

## Step 1

```text
Step_1_Download_Extract.png
```

Downloaded and extracted Assignment22_2.

---

## Step 2

```text
Step_2_Server_Port_7000.png
```

Modified streamServer.py to use port 7000.

---

## Step 3

```text
Step_3_Server_Running.png
```

Successfully started streamServer.py.

---

## Step 4

```text
Step_4_Thread_Time_Modification.png
```

Modified streamServer.py to use `time.thread_time()`.

---

## Step 5

```text
Step_5_Client_Port_7000.png
```

Modified streamClient.py to use port 7000.

---

## Step 6A

```text
Step_6_Client_Running.png
```

Client receiving streamed messages.

---

## Step 6B

```text
Step_6_Server_Receiving_Messages.png
```

Server connected to the client and transmitting packets.

---

# Key Concepts Demonstrated

## Socket Programming

Python sockets were used to establish a communication channel between a client and server.

---

## Packet Transmission

Messages were formatted with a fixed-length header and transmitted as packets.

---

## Client-Server Communication

A persistent connection was established between two applications.

---

## Message Headers

Headers were used to determine packet length and support message reconstruction.

---

## Streaming Data

Messages were continuously streamed from the server to the client without reconnecting.

---

## Thread Timing

The server generated streamed values using:

```python
time.thread_time()
```

to demonstrate dynamic message generation.

---

# Real-World Applications

The concepts demonstrated in this assignment are used in:

- Web Socket applications
- Chat systems
- Live dashboards
- Stock market feeds
- Fleet management systems
- GPS tracking platforms
- IoT telemetry systems
- Industrial monitoring systems
- Real-time notification services

---

# Fleet Intelligence Platform Connection

The same architecture can support real-time fleet telemetry.

Example:

```text
Vehicle GPS Device
          ↓
Socket Server
          ↓
Streaming Service
          ↓
Fleet Dashboard
```

Potential use cases:

- Live vehicle tracking
- Geofence alerts
- Driver activity monitoring
- Fuel event notifications
- Dispatch visibility

---

# Key Takeaways

1. Socket communication enables real-time data exchange between applications.
2. Clients and servers must communicate using the same network port.
3. Packet headers help reconstruct transmitted messages.
4. Persistent connections support streaming applications.
5. Message transmission can occur continuously without repeated reconnections.
6. Thread-generated data can be streamed dynamically.
7. Web Socket communication builds upon many of the same client-server concepts demonstrated in this assignment.
8. Real-time systems depend on reliable packet transmission and processing.

---

# Conclusion

This assignment provided practical experience implementing a client-server communication model using Python sockets. The server and client were configured to communicate on port 7000, packetized messages were transmitted using message-length headers, and real-time data was streamed between applications. The exercise demonstrated the core principles behind Web Socket communication and real-time streaming architectures that are commonly used in modern distributed systems.