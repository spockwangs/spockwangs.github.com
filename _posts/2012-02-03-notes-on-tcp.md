---
layout: post
title: TCP协议浅析
tags:
- computer network
---

## 简介

应用程序通常都需要从一个主机传送大量的数据到另一个主机。采用不可靠的传输机制
会使程序变得异常复杂和困难，因为程序需要检测传输错误和重传丢失的数据等。因此
迫切地需要一种能解决可靠性传输问题的通用机制，这就是TCP诞生的目的。有了这样
一个协议就使得应用程序无需考虑网络的各种细节。

TCP建立在无连接的、不可靠的IP协议基础之上，为达到它的目的，必须解决以下几个问题：

1.  **可靠性**：若数据丢失或出错怎么办。
2.  **按序到达**：由于IP协议传输每一帧数据时可能选择不同的路径，因此到达目标机的时间不一样。后发送的数据可能比先发送的数据先到达目标机。那么目标机如何保证组装的数据的顺序是正确的呢？
3.  **流控制**：如果源机器比目标机处理数据的速度快，那么如何保证快速的发送方不会淹没慢速的接收方？
4.  **拥塞控制**：流控制解决的是端到端（end-to-end）的传输问题，但是TCP是通过网络传输数据的，这里涉及到发送方与网络的交互问题。如果发送方发送太多的数据使得网络疲于处理，将使得网络的吞吐量极具下降，最终使网络瘫痪。TCP必须考虑到这一问题。

本文将逐一介绍TCP是如何解决这些问题的。

## 提供可靠性

“如何在不可靠的传输系统上提供可靠的传输呢？”大多数可靠的协议都用一个很简单的
技术来解决这个问题：确认和重传。它要求接收方每收到一个消息后都向发送方发送一
个确认消息。发送方记下每一个发出去的消息，在发出下一消息之前等待确认。发送方
每次发送消息时还要启动一个定时器，如果此定时器超时而确认没有收到就重新发送刚
才的消息。这就是**停等协议**（Stop-and-Wait Protocol）。

数据的丢失问题解决了，但是这个协议没有解决重复的数据。不可靠的传输技术会重复
发送数据。高延迟的网络导致过早的重传也会产生重复的数据。TCP为每一个传输的字
节分配一个**序列号**解决了这个问题。每一个确认帧也有序列号，以
表明它是对哪一个帧的确认。另外，序列号还可以表示这个数据的顺序，接收方可根据
序列号重组（reassemble）数据，这样就可以保证数据的顺序是正确的。

停等协议和序列号解决了可靠性和按序到达，但是它的效率太低了。因为每次都要等确
认帧回来后才能发送下一帧。若网络的延迟太大会大大降低传输效率。这样就诞生
了**滑动窗口算法**（sliding window algorithm）。它是停等协议的
更复杂的版本，停等协议只不过是它的一种特殊情况（窗口大小为1）。在滑动窗口算
法下，窗口内的帧都可以立即发送，然后每当确认到达后，窗口就向后移动并可以发送
更多的帧。滑动窗口算法可以更高效地利用网络带宽，因为它允许发送方在等到确认前
发送多个帧。那些已发送出去但还没有确认的帧称为未确认帧。未确认帧的数量取决于
窗口的大小。另外值得注意的是，窗口的大小不应超过序列号最大值的一半。（原因见
[Tanenbaum]的3.4.3节）。

## 可变窗口大小和流控制

TCP的滑动窗口与之前提到的版本的区别就是在TCP中这个窗口大小是可变的。TCP发送
方和接收方都有窗口。接收方的窗口大小可理解成可以接收的数据量，也就是接收缓存
大小。接收方在每一个帧中都会告诉发送方这个缓存的大小。

可变窗口不仅可以解决可靠性问题，还可以解决流控制问题。接收方若缓存不够用，为
了避免接收更多的数据，它可以减小接收窗口的大小。在极端情况下，它可以将接收窗
口设为0以停止接收数据。稍后，若接收方的可用缓存变大，它可将接收窗口增加以触
发发送发发送数据。

## 拥塞控制

拥塞控制与流控制是不同的概念。流控制是处理发送方和接收方交互的问题，而拥塞控制涉及的是发送方和网络的交互问题。

通信的主机可以通过接收窗口知道对方是否可以接收帧以及接收多少帧，但通常不知道
哪里发送了拥塞以及为什么发送拥塞。对它们来讲，拥塞仅意味着延迟变长。这样确认
超时导致重传。重传使得拥塞变得更严重。最终会使得网络完全崩溃，不能传输任何数
据。

为了避免拥塞，TCP采用两个技术实现：**slow-start（慢启动）**和
**multiplicative decrease**，并引入**拥塞窗口**（congestion window）的概念，
用于限制发送窗口的大小。也就是说，发送窗口的大小是接收窗口和拥塞窗口的较小值。

> 慢启动算法：当建立连接后初次发送数据或拥塞解除后，拥塞窗口初始为1，然后每当及时收到确认时加1。
> Multiplicative Decrease：每当丢失一个帧时（没有及时收到确认），拥塞窗口减小一半。

## 参考文献

*  [Comer] Douglas E. Comer. _Internetworking with TCP/IP_, Volume 1, Fifth Edition.
*  [Tanenbaum] _Computer Networks_, Fourth Edition.

