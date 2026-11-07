# Video 22.8: Introduction to Web Sockets (04:29)

## Overview

In this video, Dr. Williams introduces Web Sockets, a communication protocol that enables real-time, two-way communication between a client and a server over a TCP connection. Unlike traditional web requests, Web Sockets maintain a persistent connection, allowing data to flow continuously in both directions.

Web Sockets are widely used in applications that require live updates, streaming data, and low-latency communication.

---

# What Are Web Sockets?

A Web Socket is a communication protocol that creates a persistent connection between:

```text
Client
```

and

```text
Server
```

allowing both systems to send and receive data at any time.

Unlike traditional HTTP communication, the connection remains open after it is established.

---

# Traditional HTTP Communication

In a standard web application:

```text
Client Request
        ↓
Server Response
        ↓
Connection Closed
```

Each interaction requires a new request.

Example:

```text
Browser requests data
        ↓
Server sends response
        ↓
Connection ends
```

To receive updated information, the client must repeatedly ask the server for new data.

---

# HTTP Polling Problem

Without Web Sockets:

```text
Request Data
      ↓
Receive Response
      ↓
Wait
      ↓
Request Again
      ↓
Receive Response
```

This repeated polling creates:

- Additional network traffic
- Increased latency
- Higher server load
- Less efficient communication

---

# Web Socket Communication

With Web Sockets:

```text
Client
    ⇄
Server
```

A connection is established once and remains open.

Both systems can send messages whenever needed.

---

# Full-Duplex Communication

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

This differs from traditional HTTP, where communication is primarily request-response based.

---

# Establishing a Web Socket Connection

Typical workflow:

```text
Client
    ↓
Connection Request
    ↓
Server Accepts
    ↓
Persistent Connection Established
    ↓
Continuous Data Exchange
```

Once connected, communication remains active until either side closes the connection.

---

# Why Web Sockets Are Important

Web Sockets are designed for workloads that generate continuous streams of data.

Examples include:

- Real-time notifications
- Live dashboards
- Online gaming
- Stock market feeds
- IoT devices
- GPS tracking
- Chat applications

---

# Streaming Data

One of the primary uses of Web Sockets is streaming data.

Example:

```text
Sensor
    ↓
Server
    ↓
Web Socket
    ↓
Client Dashboard
```

Data continuously flows to users without requiring repeated requests.

---

# Real-Time Data Example

Traditional HTTP:

```text
Request Temperature
      ↓
Receive Temperature
      ↓
Request Again
```

Web Socket:

```text
Temperature Updates
        ↓
Automatically Pushed
        ↓
Client Receives Instantly
```

No repeated requests are required.

---

# Web Socket Architecture

Basic architecture:

```text
Client
   ⇄
Web Socket Connection
   ⇄
Server
```

The connection remains active while data is exchanged.

---

# Common Use Cases

## Chat Applications

Examples:

- Microsoft Teams
- Slack
- Discord

Messages are transmitted instantly between users.

---

## Financial Applications

Examples:

- Stock market dashboards
- Cryptocurrency exchanges
- Trading platforms

Prices update continuously in real time.

---

## Online Gaming

Examples:

- Multiplayer games
- Live game coordination
- Event synchronization

Players receive updates immediately.

---

## IoT Systems

Examples:

- Smart meters
- Environmental sensors
- Connected devices

Data streams continuously from devices to applications.

---

## GPS Tracking

Examples:

- Fleet management systems
- Vehicle tracking
- Delivery monitoring

Location updates are transmitted as they occur.

---

# Why This Matters for Data Engineering

Many modern data systems process:

```text
Streaming Data
```

rather than:

```text
Static Files
```

Examples include:

- Sensor telemetry
- Application logs
- Financial transactions
- GPS feeds
- Social media streams

Web Sockets provide an efficient mechanism for delivering this data.

---

# Relationship to Big Data

Data may be generated continuously:

```text
Device
    ↓
Web Socket
    ↓
Streaming Platform
    ↓
Analytics
```

Common downstream technologies include:

- Apache Kafka
- Spark Streaming
- AWS Kinesis
- Azure Event Hubs

---

# Web Sockets vs HTTP

| Feature | HTTP | Web Sockets |
|----------|----------|----------|
| Connection Type | Request-Response | Persistent |
| Communication | One Direction at a Time | Two-Way |
| Polling Required | Yes | No |
| Real-Time Updates | Limited | Excellent |
| Network Efficiency | Lower | Higher |
| Streaming Support | Limited | Excellent |

---

# Advantages of Web Sockets

## Real-Time Communication

Data is delivered immediately.

---

## Reduced Latency

No need to repeatedly establish connections.

---

## Lower Overhead

Fewer requests and responses are required.

---

## Continuous Data Streams

Ideal for live data applications.

---

## Bidirectional Communication

Clients and servers can communicate simultaneously.

---

# Limitations

## Persistent Connections

Open connections consume resources.

---

## Scalability Challenges

Large numbers of concurrent connections require careful infrastructure planning.

---

## Complexity

Managing long-lived connections is more complex than traditional HTTP requests.

---

# Key Takeaways

1. Web Sockets provide two-way communication between clients and servers.
2. Web Sockets operate over TCP networks.
3. Connections remain open after initialization.
4. Communication is full-duplex.
5. Web Sockets support real-time data delivery.
6. Streaming applications commonly rely on Web Sockets.
7. Polling is not required once a connection is established.
8. Web Sockets reduce latency and network overhead.
9. They are widely used in chat, gaming, financial, IoT, and tracking systems.
10. Web Sockets are an important technology for real-time data engineering applications.

---

# Personal Notes

### Fleet Intelligence Platform Perspective

This lesson is highly relevant to the Fleet Intelligence Platform.

Current workflow:

```text
Vehicle
    ↓
GPS Device
    ↓
Backend API
    ↓
Database
```

Future real-time workflow:

```text
Vehicle
    ↓
GPS Device
    ↓
Web Socket
    ↓
Backend
    ↓
Live Map
```

Using Web Sockets, vehicle locations could be transmitted instantly to the application without requiring users to refresh the page.

Examples:

- Live vehicle tracking
- Geofence alerts
- Fuel events
- Driver activity monitoring
- Real-time dispatching

---

### Data Engineering Perspective

Web Sockets are a foundational technology for modern streaming architectures.

Typical architecture:

```text
Data Source
      ↓
Web Socket
      ↓
Streaming Platform
      ↓
Analytics
      ↓
Dashboard
```

Similar concepts are used throughout:

- Apache Kafka
- AWS Kinesis
- Amazon MSK
- Azure Event Hubs
- Spark Streaming
- Flink

Understanding Web Sockets provides a strong foundation for learning real-time data pipelines and event-driven architectures used throughout modern data engineering systems.