# Coding Activity 22.4: Streaming Web Sockets

## Overview

In this activity, I implemented Web Socket communication using Python's built-in `socket` library. The objective was to understand how data is streamed between a server and a client through a persistent connection, and how packetized messages can be transmitted using a message-length header.

The activity demonstrated several core concepts including:

- Creating a socket server
- Creating a socket client
- Establishing a TCP connection
- Streaming data between client and server
- Packet transmission
- Message headers
- Debugging streamed packet data
- Inspecting packet contents during execution

---

# Learning Outcome

Stream data through Web Sockets.

---

# Activity Objectives

- Download and configure the Streaming repository.
- Start a socket-based streaming server.
- Connect multiple clients to the server.
- Receive streamed messages.
- Understand packet formatting.
- Review message headers.
- Debug client-side packet processing.
- Inspect packet data during execution.

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

## Library Used

```python
import socket
```

The Python socket library was used to implement communication between the server and client applications.

---

# Repository Setup

## Repository

```text
johntango/Streaming
```

## Project Structure

```text
Streaming
│
├── streamServer.py
├── streamClientEx1.py
├── streamClient01Soln.py
├── ex001.py
└── ...
```

---

# Step 1: Download and Extract the Streaming Repository

## Objective

Download and extract the Streaming GitHub repository to the local machine.

## Result

The repository was successfully downloaded and extracted.

### Files Available

```text
streamServer.py
streamClientEx1.py
streamClient01Soln.py
```

These files provide the server and client implementations used throughout the activity.

### Screenshot

```text
Step_1_Download_Repository.png
```

---

# Step 2: Open streamServer.py

## Objective

Open the Web Socket server implementation in Visual Studio Code.

## Result

The file opened successfully.

### Key Components

#### Create Socket

```python
socket.socket(
    socket.AF_INET,
    socket.SOCK_STREAM
)
```

#### Bind to Port

```python
ws.bind(
    (socket.gethostname(), 9092)
)
```

#### Listen for Connections

```python
ws.listen(5)
```

#### Accept Connections

```python
(clientsocket, address) = ws.accept()
```

### Screenshot

```text
Step_2_StreamServer_Open.png
```

---

# Step 3: Start the Server

## Objective

Launch the server process.

## Command

```cmd
python streamServer.py
```

## Result

The server started successfully.

Initially, no output was displayed because the server was waiting for an incoming client connection.

The server was listening on:

```text
Port 9092
```

### Screenshot

```text
Step_3_Server_Running.png
```

---

# Step 4: Run streamClientEx1.py

## Objective

Connect a client to the server and receive streamed messages.

## Command

```cmd
python streamClientEx1.py
```

## Result

The client successfully connected and received streamed packet data.

### Example Output

```text
Message:30 The time is ...
```

Messages were received from the server prior to encountering the packet parsing issue intentionally addressed later in the activity.

### Screenshot

```text
Step_4_ClientEx1_Message.png
```

---

# Packet Header Concept

Each packet contains:

```text
Header
+
Payload
```

Example:

```text
30        The time is 1794167956.9506295
```

Where:

```text
30
```

represents the payload length.

The client uses the header value to determine how much data belongs to the current message.

---

# Step 5: Verify Server Output

## Objective

Verify that the server established a connection and transmitted packets.

## Result

The server accepted the client's connection.

### Connection Established

```text
Connect from ('192.168.1.47', 53120) established
```

### Messages Sent

```text
30        The time is 1794167956.9506295

30        The time is 1794167956.9516172

29        The time is 1794167956.952619
```

This confirmed that packets were actively streaming from server to client.

### Screenshot

```text
Step_5_Server_Output.png
```

---

# Step 6: Run streamClient01Soln.py

## Objective

Use the corrected client implementation.

## Command

```cmd
python streamClient01Soln.py
```

## Result

The corrected client successfully handled packet boundaries and continuously processed incoming messages.

### Example Output

```text
M:30        The time is 1794168511.2604916

M:30        The time is 1794168511.2614968
```

Unlike the earlier client implementation, the solution version properly handled remaining packet data.

### Screenshot

```text
Step_6_Client01Soln_Message.png
```

---

# Packet Boundary Handling

The corrected implementation included:

```python
next = full_msg[total_msg_len:]

full_msg = next
```

This logic preserves any remaining packet data after a complete message is processed.

As a result:

```text
Packet Fragment
      ↓
Retained
      ↓
Processed Correctly
```

This prevents packet alignment issues encountered by the original client.

---

# Step 7: Add a Debugging Breakpoint

## Objective

Add a debugging breakpoint in the corrected client.

## Breakpoint Location

```python
if new_msg:
```

Located on:

```text
Line 13
```

## Result

The breakpoint was successfully added and the debugger was configured.

### Screenshot

```text
Step_7_Debug_Breakpoint.png
```

---

# Step 8: Debug the Client

## Objective

Run the application in debugging mode and inspect incoming packet data.

## Result

Execution paused at the breakpoint.

The Variables panel displayed:

```python
msg
```

### Value Observed

```text
'29       The ti'
```

This value represents a packet fragment received from the server.

The assignment notes that packet values may vary depending on when execution reaches the breakpoint.

Examples include:

```text
'29       The ti'
```

```text
'30       The ti'
```

or other packet fragments.

### Screenshot

```text
Step_8_Debug_Msg_Variable.png
```

---

# Server Workflow

```text
Server Starts
      ↓
Listen On Port 9092
      ↓
Client Connects
      ↓
Generate Message
      ↓
Add Header
      ↓
Send Packet
      ↓
Client Receives Data
```

---

# Client Workflow

```text
Connect To Server
       ↓
Receive Packet
       ↓
Read Header
       ↓
Determine Message Length
       ↓
Extract Payload
       ↓
Display Message
```

---

# Final Results

| Component | Status |
|------------|------------|
| Repository Downloaded | ✅ |
| Server Opened | ✅ |
| Server Running | ✅ |
| Client Connected | ✅ |
| Messages Received | ✅ |
| Server Streaming Verified | ✅ |
| Solution Client Executed | ✅ |
| Breakpoint Added | ✅ |
| Packet Debugged | ✅ |

---

# Key Concepts Demonstrated

## TCP Socket Communication

A persistent connection was established between the server and clients using TCP sockets.

---

## Streaming Data

The server continuously streamed data packets to connected clients.

---

## Message Headers

Every packet contained a header defining payload length.

Example:

```text
30        The time is ...
```

---

## Packet Processing

Clients used the header information to determine how much data belonged to a single message.

---

## Debugging Network Applications

VS Code debugging tools were used to inspect packet contents during execution.

---

## Packet Boundary Handling

The activity demonstrated why TCP stream processing must properly handle partial packets and multiple messages in a buffer.

---

# Real-World Applications

These concepts are commonly used in:

- Web Socket servers
- Real-time dashboards
- Chat applications
- Financial market feeds
- GPS tracking platforms
- Fleet management systems
- IoT telemetry systems
- Sensor networks
- Event streaming architectures

---

# Fleet Intelligence Platform Connection

This activity directly relates to real-time fleet telemetry systems.

Potential architecture:

```text
Vehicle GPS Device
         ↓
Socket Server
         ↓
Streaming Service
         ↓
Web Dashboard
```

Possible use cases include:

- Live vehicle tracking
- Geofence notifications
- Fuel event alerts
- Driver location updates
- Vehicle status monitoring

---

# Key Takeaways

1. Web Sockets rely on persistent communication channels.
2. TCP packets often arrive in chunks rather than complete messages.
3. Message headers help identify payload lengths.
4. Clients must properly handle packet boundaries.
5. Debugging tools are valuable for analyzing network traffic.
6. Streaming architectures rely on continuous message exchange.
7. Real-time systems frequently use socket-based communication.
8. The same concepts are used in modern event-driven systems and streaming platforms.

---

# Conclusion

In this activity, I implemented streaming communication using Python socket programming. A server application was launched to generate and stream packetized messages, while multiple clients connected and received the transmitted data. By examining packet headers, processing payloads, and debugging message fragments, I gained a practical understanding of how data is streamed between a server and client. This exercise demonstrated the foundational concepts behind Web Socket communication, packet processing, and real-time streaming systems that are commonly used in modern data engineering applications.