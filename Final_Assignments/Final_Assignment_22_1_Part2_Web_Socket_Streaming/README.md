# Final Assignment 22.1 (Part 2): Processing and Streaming Big Data

## Overview

This assignment focused on implementing real-time communication using Python sockets and Web Socket concepts. The objective was to establish a persistent connection between a server and a client, modify network communication settings, transmit packetized messages, and observe how data is streamed between applications.

The exercise provided hands-on experience working with socket programming, packet creation, message headers, client-server communication, and streaming data over a network connection.

---

# Learning Outcome

Stream data through Web Sockets.

---

# Assignment Objectives

- Configure a socket-based server.
- Configure a socket-based client.
- Modify communication ports.
- Implement packet transmission using message headers.
- Modify timestamp logic using the `thread_time()` function.
- Establish communication between a client and server.
- Observe packet streaming behavior.
- Verify successful message transfer.

---

# Environment

## Development Environment

```text
Visual Studio Code
```

## Programming Language

```text
Python
```

## Python Library

```python
socket
```

## Additional Library

```python
time
```

---

# Assignment Files

## Server Application

```text
streamServer.py
```

Responsibilities:

- Create socket server
- Listen for client connections
- Generate messages
- Construct packet headers
- Stream messages to connected clients

---

## Client Application

```text
streamClient.py
```

Responsibilities:

- Connect to server
- Receive packets
- Process message headers
- Display streamed messages

---

# Step 1: Download and Extract Assignment22_2

## Objective

Download and extract the Required Final Assignment 22.1 (Part 2) folder.

## Result

The Assignment22_2 folder was successfully downloaded and extracted.

### Files Included

```text
streamServer.py
streamClient.py
```

These files were used throughout the assignment to implement socket-based communication.

### Screenshot

```text
Step_1_Download_Extract.png
```

### Caption

```text
Figure 1. Successfully downloaded and extracted the Assignment22_2 folder.
```

---

# Step 2: Modify Server Port

## Objective

Update the server application to listen on port:

```text
7000
```

## Modification

### Original

```python
ws.bind(
    (socket.gethostname(), PORT)
)
```

### Updated

```python
ws.bind(
    (socket.gethostname(), 7000)
)
```

## Result

The server was configured to listen for incoming connections using port 7000.

### Screenshot

```text
Step_2_Server_Port_7000.png
```

### Caption

```text
Figure 2. Modified streamServer.py and updated the server port to 7000.
```

---

# Step 3: Run streamServer.py

## Objective

Start the server and verify successful execution.

## Command

```cmd
python streamServer.py
```

## Result

The server launched successfully and began listening for incoming client connections.

At this stage the terminal remained idle while waiting for a connection request from the client application.

### Screenshot

```text
Step_3_Server_Running.png
```

### Caption

```text
Figure 3. Successfully started streamServer.py and placed the server in listening mode.
```

---

# Step 4: Implement thread_time()

## Objective

Modify the application so the server transmits values generated using:

```python
time.thread_time()
```

## Original Logic

The server previously used another time function to generate timestamps.

## Updated Logic

```python
msg = f"The time is {time.thread_time()}"
```

## Result

The server now reports the CPU time consumed by the current thread rather than traditional wall clock time.

### Screenshot

```text
Step_4_Thread_Time_Modification.png
```

### Caption

```text
Figure 4. Modified streamServer.py to call the time.thread_time() function.
```

---

# Step 5: Modify Client Port

## Objective

Update the client application so it connects using the same port as the server.

## Modification

### Updated Connection

```python
ws.connect(
    (socket.gethostname(), 7000)
)
```

## Result

The client application was configured to connect to the server using port 7000.

### Screenshot

```text
Step_5_Client_Port_7000.png
```

### Caption

```text
Figure 5. Modified streamClient.py to connect using port 7000.
```

---

# Step 6A: Run streamClient.py

## Objective

Establish communication between the client and server.

## Command

```cmd
python streamClient.py
```

## Result

The client successfully connected to the server and began receiving packets.

### Example Output

```text
M:19 The time is 0.03125
```

The output shows that:

- Header values were received.
- Messages were decoded correctly.
- Packet transmission was successful.
- Streaming communication was active.

### Screenshot

```text
Step_6_Client_Running.png
```

### Caption

```text
Figure 6. Successfully executed streamClient.py and received streamed packets from the server.
```

---

# Step 6B: Verify Server Communication

## Objective

Confirm that the server accepted the client connection and streamed packets successfully.

## Result

The server displayed:

### Connection Established

```text
Connect from ('192.168.1.47', 58047) established
```

### Streamed Messages

```text
19 The time is 0.03125
```

repeated continuously while the client remained connected.

This verified:

- Successful socket connection.
- Successful packet construction.
- Successful packet transmission.
- Successful streaming communication.

### Screenshot

```text
Step_6_Server_Receiving_Messages.png
```

### Caption

```text
Figure 7. Server console showing an established client connection and streaming messages transmitted to the client.
```

---

# Packet Structure

The server constructed messages using a fixed-width header.

## Message Format

```text
HEADER + PAYLOAD
```

Example:

```text
19        The time is 0.03125
```

### Header

```text
19
```

Represents:

```text
Message Length
```

### Payload

```text
The time is 0.03125
```

Represents:

```text
Actual Message Data
```

---

# Server Workflow

```text
Server Starts
      ↓
Listen on Port 7000
      ↓
Client Connects
      ↓
Generate Message
      ↓
Add Header
      ↓
Send Packet
      ↓
Repeat
```

---

# Client Workflow

```text
Start Client
      ↓
Connect to Server
      ↓
Receive Packet
      ↓
Read Header
      ↓
Determine Message Length
      ↓
Extract Message
      ↓
Display Output
```

---

# Key Concepts Demonstrated

## Socket Programming

Python sockets were used to establish communication between applications.

---

## Persistent Connections

The client and server maintained an active communication channel.

---

## Streaming Data

Messages were continuously transmitted from server to client.

---

## Packet Headers

Each transmitted packet included a header describing message length.

---

## Message Decoding

The client extracted message information using header values.

---

## CPU Thread Timing

The application utilized:

```python
time.thread_time()
```

to generate timing information.

---

# Real-World Applications

The concepts demonstrated in this assignment are used in:

- Chat applications
- Live dashboards
- Stock market feeds
- GPS tracking systems
- Fleet management platforms
- IoT monitoring systems
- Real-time notification services
- Financial trading systems
- Network monitoring platforms

---

# Fleet Intelligence Platform Connection

This assignment directly relates to real-time telemetry solutions.

Potential architecture:

```text
Vehicle GPS Device
          ↓
Socket Server
          ↓
Streaming Service
          ↓
Fleet Dashboard
```

Possible applications:

- Vehicle tracking
- Geofence monitoring
- Driver activity updates
- Fuel event notifications
- Real-time dispatch visibility

---

# Challenges Encountered

## Port Synchronization

The server and client initially required configuration updates so both applications could communicate using the same port.

### Resolution

Both applications were updated to use:

```text
7000
```

---

## Message Formatting

Packet transmission required the use of message headers to identify payload length.

### Resolution

Messages were formatted using:

```python
msg = f"{len(msg):<{HEADER}}" + msg
```

ensuring packets could be reconstructed correctly by the client.

---

# Key Takeaways

1. Socket programming enables direct communication between applications.
2. Clients and servers must use the same communication port.
3. Packet headers allow messages to be reconstructed correctly.
4. Persistent connections support streaming communication.
5. Clients can continuously receive streamed data without reconnecting.
6. Socket-based systems form the foundation of many real-time applications.
7. Web Socket communication relies on many of the same core concepts demonstrated in this exercise.
8. Real-time systems depend on efficient packet transmission and reliable message processing.

---

# Conclusion

In this assignment, Python socket programming was used to implement a server and client capable of streaming packetized messages through a persistent connection. The server was modified to use the `time.thread_time()` function and configured to communicate on port 7000. After connecting the client and server, messages were successfully transmitted, received, decoded, and displayed. This exercise reinforced the fundamental concepts of Web Socket communication, packet creation, message headers, and real-time data streaming used throughout modern distributed systems and streaming applications.