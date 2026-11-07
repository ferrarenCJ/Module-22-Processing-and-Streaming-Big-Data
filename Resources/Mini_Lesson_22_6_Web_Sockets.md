# Mini-Lesson 22.6: Web Sockets

## Overview

Web Sockets provide a persistent, bidirectional communication channel between a client and a server. Unlike traditional HTTP communication, which follows a request-response model, Web Sockets maintain an open TCP connection that allows both parties to exchange data continuously in real time.

Web Sockets were developed to overcome limitations in HTTP and enable applications that require constant, low-latency communication.

---

# Learning Objectives

By the end of this lesson, you should be able to:

- Explain why Web Sockets were created.
- Understand the limitations of HTTP communication.
- Describe how Web Socket connections work.
- Identify the components of a Web Socket URL.
- Understand Web Socket frames and opcodes.
- Explain how Web Socket connections are closed.
- Recognize real-world use cases for Web Sockets.

---

# What Is a Web Socket?

A Web Socket is a persistent communication channel between:

```text
Client
```

and

```text
Server
```

that operates over a single TCP connection.

Unlike HTTP connections that open and close repeatedly, a Web Socket connection remains open until either the client or server decides to close it.

---

# Why Are Web Sockets Needed?

## Traditional HTTP Communication

HTTP follows a request-response model:

```text
Client Request
       ↓
Server Response
       ↓
Connection Ends
```

The server cannot send information unless the client first requests it.

This means communication is:

```text
Unidirectional
```

from the perspective of initiating communication.

---

## HTTP Limitation

Example:

```text
Stock Price Dashboard
```

Using HTTP:

```text
Request Price
      ↓
Receive Price
      ↓
Request Again
      ↓
Receive Updated Price
```

The client must repeatedly ask for updates.

Problems:

- Increased network overhead
- Higher latency
- More server resources consumed
- Poor scalability for frequent updates

---

# Long Polling

Before Web Sockets became common, many applications used:

```text
Long Polling
```

Long polling keeps an HTTP request open for an extended period while the server waits for new data.

Example:

```text
Client Request
      ↓
Server Waits
      ↓
Data Available
      ↓
Server Responds
```

This provides near real-time updates.

---

# Problems With Long Polling

Although useful, long polling has drawbacks:

- Server resources remain occupied
- Connections stay open unnecessarily
- Increased infrastructure overhead
- Less efficient for high-frequency communication

Long polling works best when updates occur infrequently.

---

# How Web Sockets Work

Web Sockets eliminate the repeated request-response cycle.

Workflow:

```text
Client
    ↓
HTTP Handshake
    ↓
Server Accepts
    ↓
Web Socket Connection Established
    ↓
Persistent Communication Channel
```

Once established:

```text
Client ⇄ Server
```

Data can flow freely in both directions.

---

# Bidirectional Communication

Web Sockets support:

```text
Full-Duplex Communication
```

Meaning:

```text
Client → Server

Server → Client
```

can occur simultaneously.

This is one of the primary advantages of Web Sockets over HTTP.

---

# TCP Connection

Web Sockets operate over:

```text
TCP
```

Transmission Control Protocol provides:

- Reliable delivery
- Ordered packets
- Error detection
- Connection management

Data is exchanged through small units called:

```text
Packets
```

---

# Persistent Connections

Once a Web Socket connection is created:

```text
Client ⇄ Server
```

the connection remains active.

Advantages:

- Lower latency
- Reduced overhead
- Faster response times
- Efficient streaming

Communication continues until:

```text
Client closes connection
```

or

```text
Server closes connection
```

---

# Web Socket URLs

Unlike HTTP URLs:

```text
http://
https://
```

Web Socket URLs use:

```text
ws://
```

or

```text
wss://
```

---

## Unsecured Web Socket

```text
ws://host:port/path
```

Example:

```text
ws://localhost:8080/socket
```

---

## Secure Web Socket

```text
wss://host:port/path
```

Example:

```text
wss://example.com/socket
```

This is similar to:

```text
HTTPS
```

for Web Sockets.

---

# Web Socket URL Structure

General format:

```text
ws://host[:port]/path?query
```

or

```text
wss://host[:port]/path?query
```

Components:

```text
Protocol
Host
Port
Path
Query Parameters
```

---

# Web Socket Protocol

Web Socket communication occurs through:

```text
Frames
```

Frames contain:

- Metadata
- Payload data
- Communication instructions

---

# Frame Structure

Each frame contains:

```text
Frame Type
Payload Length
Payload Data
```

When messages become too large:

```text
Frame
      ↓
Multiple Smaller Frames
```

allowing large messages to be transmitted efficiently.

---

# Web Socket Frame Types

Two general categories:

## Non-Control Frames

Used for data transmission.

Examples:

- Text data
- Binary data
- Message continuation

---

## Control Frames

Used for connection management.

Examples:

- Connection close
- Ping
- Pong

---

# Web Socket Opcodes

Every frame contains:

```text
Opcode
```

which tells the receiver how to interpret the frame.

---

## Opcode 0x00

```text
Continuation Frame
```

Continues data from a previous frame.

---

## Opcode 0x01

```text
Text Frame
```

Represents text data.

---

## Opcode 0x02

```text
Binary Frame
```

Represents binary data.

---

## Opcode 0x03 - 0x07

```text
Reserved For Future Use
```

---

## Opcode 0x08

```text
Close Frame
```

Requests termination of the Web Socket connection.

---

## Opcode 0x09

```text
Ping Frame
```

Heartbeat message that checks whether the connection remains active.

---

## Opcode 0x0A

```text
Pong Frame
```

Response to a ping frame confirming the connection is still active.

---

## Opcode 0x0B - 0x0F

```text
Reserved For Future Use
```

---

# Ping and Pong Mechanism

Web Sockets use heartbeat messages to verify connectivity.

Example:

```text
Server
   ↓ Ping
Client
   ↓ Pong
Server
```

Benefits:

- Detects broken connections
- Keeps connections active
- Supports connection monitoring

---

# Closing a Web Socket Connection

Connection closure begins when either side sends:

```text
Opcode 0x08
```

Example:

```text
Client
    ↓ Close Request
Server
    ↓ Acknowledgement
Connection Closed
```

The close frame usually contains:

```text
Reason for closing
```

Once both parties acknowledge the close request:

```text
TCP Connection Ends
```

---

# HTTP vs Web Sockets

| Feature | HTTP | Web Sockets |
|----------|----------|----------|
| Connection | Temporary | Persistent |
| Communication | Request-Response | Bidirectional |
| Real-Time Updates | Limited | Excellent |
| Polling Required | Yes | No |
| Overhead | Higher | Lower |
| Streaming Support | Limited | Excellent |

---

# Real-World Applications

## Chat Applications

Examples:

- Microsoft Teams
- Slack
- Discord

Messages appear instantly.

---

## Stock Trading Platforms

Examples:

- TradingView
- Robinhood
- Interactive Brokers

Real-time price updates.

---

## Online Gaming

Examples:

- Multiplayer games
- Live game state synchronization

---

## IoT Devices

Examples:

- Smart sensors
- Home automation devices
- Industrial monitoring systems

---

## GPS Tracking

Examples:

- Fleet management
- Package delivery tracking
- Ride-sharing applications

---

## Live Dashboards

Examples:

- Monitoring systems
- Operational dashboards
- Infrastructure monitoring

---

# Data Engineering Applications

Many streaming systems rely on Web Sockets.

Typical architecture:

```text
Sensors
    ↓
Web Socket
    ↓
Application
    ↓
Streaming Platform
    ↓
Analytics
```

Examples:

- Real-time telemetry
- Vehicle tracking
- Financial data feeds
- Application monitoring

---

# Fleet Intelligence Platform Connection

For the Fleet Intelligence Platform:

Current model:

```text
Vehicle
    ↓
Database
    ↓
Dashboard Refresh
```

Future real-time architecture:

```text
Vehicle
    ↓
Web Socket
    ↓
Backend Service
    ↓
Live Dashboard
```

Benefits:

- Instant GPS updates
- Real-time geofence alerts
- Immediate fuel event notifications
- Live vehicle monitoring

---

# Key Takeaways

1. Web Sockets provide persistent communication between a client and server.
2. Communication is bidirectional and full-duplex.
3. Web Sockets overcome limitations of traditional HTTP communication.
4. Long polling was an earlier workaround for HTTP limitations.
5. Web Socket URLs use `ws://` or `wss://`.
6. Communication occurs through frames.
7. Frames contain opcodes that define their purpose.
8. Ping and Pong messages monitor connection health.
9. Close frames terminate connections safely.
10. Web Sockets are widely used in streaming, IoT, gaming, finance, and real-time analytics applications.

---

# Personal Notes

### Data Engineering Perspective

Web Sockets are foundational to modern streaming architectures.

Common pattern:

```text
Data Producer
      ↓
Web Socket
      ↓
Application Layer
      ↓
Streaming Platform
      ↓
Analytics
```

This pattern appears in:

- Apache Kafka ecosystems
- AWS Kinesis
- Azure Event Hubs
- Spark Streaming
- Apache Flink

Understanding Web Sockets is an important step toward learning event-driven systems, real-time analytics, and streaming data pipelines that are central to modern data engineering.