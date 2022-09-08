---
title: Kernels and Operating Systems - Linux
description: Kernels and Operating Systems - Linux
class: gaia
_class:
  - lead
  - invert
style: |
    #img-right{
      float: right;
    }
    table {
        border-collapse: collapse;
        font-size: 30px;
      }
    table, th,tr, td {
         border: none!important; 
          vertical-align: middle;
      }
size: 16:9
paginate: true
_paginate: false
marp: true
math: true
---

# Kernels and Operating Systems - Linux

    Course Code: ELEE1119 
    
    Course Name: Advanced Computer Engineering

    Credits: 30

    Module Leader: Seb Blair BEng(H) PGCAP MIET MIHEEM FHEA

---

## What is Linux?

![](./figures/kernel_meme.png)

---

## Linux is...

- a kernel developed by Linus Torvald in the 1994 
- it's Free and Open-Source
- monolithic
- modular
- currently at version 5.19 in development

---

## Linux Kernel
<div align=center>

|**Six Major Functions**| **Six Layers** |
|-----------------------|----------------|
|  System               | Userspace Interfaces    |
| Processing            | Virtual |
| Memory                | Brdiges |
| Storage               | Functional |             
| Networking            | Devices Control |
| Human interface       |Hardware Interfaces |

</div>

<!--https://upload.wikimedia.org/wikipedia/commons/5/5b/Linux_kernel_map.png-->

---

## Kernel is...

If implemented properly the Kernel is invisible to the user, working in its own little world known as the **Kernel Space**. Like where it allocates memory and track of where everything is stored. The **User Space** is the files or applications, what the user sees!

The Kernel is **software​**

![ bg right:50% opacity:.9 ](./figures/kernel.png)

---

##

![ bg contain ](./figures/kernel_types.png)

---