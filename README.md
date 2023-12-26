## NUP23 Exam files

### Schematics

```
           [BONUS]

  [WIFI] [TCP] [REV] [TLS]
      \   /      \   /
      [DNS]     [HTTP]
          \     /
          [PCAP]

```

#### PCAP - 12% ( 120 points )

You're given a pcap file with large  ( > 100000 ) amount of packets
Your goal is to find the flag into **multicast UDP packet** with **broken IP checksum**.

#### DNS - 14% ( 140 points )

You're given a binary for Linux/OSX Arm/OSX Intel/Windows that works as a DNS server.
This DNS server emulates multiple DNS servers by using different ports.
This server has a well-known security flaw.
Your goal is to find __FLAG__ type record.

#### HTTP - 14% ( 140 points )

You're given a binary for Linux/OSX Arm/OSX Intel/Windows that works as an HTTP server.
This HTTP server uses H/1.1337 HTTP version that is unsupported in most browsers.
Start from / and follow the instructions to get your flag.

#### WIFI - 15% ( 150 points )

You're given a pcap file with captured WIFI traffic. Using all the tools you may find on the Internet, decrypt the
traffic and find the flag.
P.S. Flag is not so obvious seen, it's somewhere in the traffic exchange.

#### TCP - 15% ( 150 points )

You're given a binary for Linux/OSX Arm/OSX Intel/Windows that must be run as root.
Your goal is to connect to the TCP port the program listens ( use your best judgement or your network scanning tools or
your OS system tools to find the port ).
After the connection is established - send the "getflag" command.
P.S. If you got "connection reset" error - this is the part of the task. Enjoy.

#### TLS - 15% ( 150 points )

You're given a binary for Linux/OSX Arm/OSX Intel/Windows that listens TCP port 4888 with custom SSL/TLS.
You're also given a PCAP file with a single successfull connection. You may find there that TLS uses some unstandard
constants there.
Your goal is to connect to the port and send the "getflag" command.

#### REV - 15% ( 150 points )

You're given a pcap file with captured traffic of unknown protocol. Also you're given the protocol details in writings.
Your goal is to reverse engineer the protocol, collect the data and find the flag.

#### BONUS - 15% ( 150 points )

You can solve bonus task instead of any other given task and still get your 100% mark.
Or you can solve bonus task on top of your 100% score just because you feel unhappy to leave any unsolved tasks here.

( I've no idea what to put there yet )
