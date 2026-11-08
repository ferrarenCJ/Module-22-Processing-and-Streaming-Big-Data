# Knowledge Check Activity: Parallel Computing and Web Sockets

## Overview

This optional drag-and-drop activity reviewed the major concepts covered throughout Module 22, including parallel computing, parallel processing, threads, race conditions, Web Sockets, and real-time communication. The activity reinforced key terminology and concepts introduced during lessons on DASK, distributed computing, and Web Socket streaming.

---

# Activity Objective

Complete the sentences using the correct terminology related to:

- Parallel computing
- Sequential processing
- Threads
- Race conditions
- Web Sockets
- HTTP communication
- Long polling
- Streaming data

---

# Completed Answers

| Blank | Correct Answer |
|---------|---------|
| 1 | compiler |
| 2 | machine-language |
| 3 | central |
| 4 | tasks |
| 5 | sequence |
| 6 | energy-efficient |
| 7 | thread |
| 8 | race condition |
| 9 | bidirectional |
| 10 | HTTP |
| 11 | unidirectional |
| 12 | long polling |
| 13 | push |
| 14 | connection |
| 15 | wss:// |
| 16 | path |
| 17 | extension |

---

# Completed Passage

## Parallel Computing

When traditional computers were first introduced, a **compiler** would accept a set of instructions. The compiler would then transform these human-written instructions into a set of **machine-language** instructions. After that, the set of instructions would be fed through the **central** processing unit (CPU) to be executed sequentially in a specific series.

Parallel computing and parallel processing extend the capabilities of sequential computing by distributing the set of instructions across multiple CPUs. This way, the initial problem is divided into different **tasks**. After that, each task is executed by a different processor in **sequence**.

One of the advantages of parallel computing is that it makes the work execution faster and more **energy-efficient**. On the other hand, problems can also arise in parallel computing. For example, if a **thread** encounters an instruction that reads a variable from memory at the same time that another thread is attempting to write that same variable to memory, you will encounter a **race condition**.

---

## Web Sockets

A Web Socket is a steady connection between a client and a server. Web Sockets provide a **bidirectional** communications channel that operates over **HTTP** networks.

Web Sockets were created in response to the limitations of HTTP-based technology. In the HTTP protocol, a client requests a resource and the server responds with the requested data, making it a **unidirectional** protocol.

Web Sockets overcome this limitation by using **long polling**. Long polling allows a client to make an HTTP request with a long timeout period so that the client connection can be held to allow the server more time to **push** data to the client.

This allows the Web Socket connection between client and server to remain open and the communications continue through the Web Socket until both parties decide that the **connection** should be closed.

Because Web Sockets do not follow HTTP protocol, they follow the `ws://` or **`wss://`** extension. The rest of the URL is structured the same as an HTTP URL and contains a host, port, **path**, and any query parameters.

Additionally, connections between a server and a client using Web Sockets must be made between URLs that have the same **extension**.

---

# Key Concepts Reinforced

## Parallel Computing

Parallel computing improves processing speed by dividing a problem into smaller tasks that can be executed across multiple processors.

### Benefits

- Faster execution
- Improved scalability
- Better utilization of computing resources
- Greater efficiency for large datasets

---

## Threads

A thread is a unit of execution within a process.

Characteristics:

- Processed by CPU cores
- Shares memory with other threads in the same process
- Supports concurrent execution

---

## Race Conditions

A race condition occurs when multiple threads access the same memory location simultaneously and at least one thread modifies the value.

Potential impacts:

- Data corruption
- Inconsistent results
- Difficult-to-debug application errors

---

## Web Sockets

Web Sockets provide real-time, bidirectional communication between clients and servers through a persistent connection.

Advantages:

- Lower latency
- Reduced network overhead
- Continuous communication
- Real-time updates

---

## Long Polling

Long polling was introduced as a workaround for HTTP limitations.

Workflow:

```text
Client Request
      ↓
Server Waits For Data
      ↓
Server Responds
      ↓
Client Opens New Request
```

Web Sockets improve upon this approach by maintaining a persistent connection.

---

# Key Takeaways

1. Compilers convert human-written code into machine-language instructions.
2. Traditional CPUs execute instructions sequentially.
3. Parallel processing divides problems into smaller tasks.
4. Threads enable concurrent execution.
5. Race conditions can occur when threads access shared memory simultaneously.
6. Web Sockets support bidirectional communication.
7. HTTP is primarily a unidirectional protocol.
8. Long polling was an early approach for near real-time communication.
9. Web Sockets enable continuous communication through persistent connections.
10. Secure Web Socket connections use the `wss://` protocol.

---

# Conclusion

This activity reinforced the fundamental concepts introduced throughout Module 22. The exercise reviewed sequential and parallel processing, the role of threads in computation, race conditions in parallel environments, and the communication model used by Web Sockets. Together, these concepts provide a foundation for understanding modern distributed systems, parallel processing platforms such as DASK, and real-time streaming architectures used throughout data engineering.