---
title: Universally Unique Identifiers
description: Universally Unique Identifiers ppt
class: gaia
_class:
  - lead
  - invert
style: |
    img[alt~="center"] {
      display: block;
      margin: 0 auto;
    }
    img-right{
      float: right;
    }
    table{
      font-size: 18 px;
    }
size: 16:9
paginate: true
_paginate: false
marp: true
math: true
---

# Universally Unique Identifiers (UUIDs)

    Course Code: ELEE1119 
    
    Course Name: Advanced Computer Engineering

    Credits: 30

    Module Leader: Seb Blair BEng(H) PGCAP MIET MIHEEM FHEA
    
---

## UUIDs

- 32 base 16 characters ([0-9][A-F])

<div align=center>    

$128=32 \cdot log_2(16)$

</div>

- 128 bit numbers

![h:300 center](../../figures/uuidv1.png)

<div align=center>

UUID Version 1 
</div> 

--- 

## UUID Versions

There are 8 versions as of  23 June 2022 

- UUID1 = Timebased + Unique or MAC [no repeats till 3603AD] ​

- UUID2 = Timebased(LSB) + userid​

- UUID3 = Namespace+MD5 hash​

- UUID4 = PRNG [1 trillion UUIDs for a chance of 2 repeats]​

- UUID5 = Namespace + SHA-1 hash​

- UUID6 = Timestamp and monotonic counter.

- UUID7 = UNIX Timestamp

- UUID8 - User defined Data

<!--
(RFC4122 Gregorian calendar no roll overs till 3603)
-->

---

## Who?

- Created by Microsoft but standardised by the **Internet Engineering Task Force** (IETF) and the **International Telecommunication Union** (ITU), so that each user or thing can be uniquely identifiable. 
-  **ITU-T X.667 | ISO/IEC 9834-8**​
![bg right:50% 50% vertcial](https://miro.medium.com/v2/resize:fit:640/format:webp/1*eOxYCicU2O_DHk5CWJS9TQ.png)

![bg right:50% 40% vertical](https://cdn.freebiesupply.com/logos/large/2x/itu-logo-png-transparent.png)
![bg right:50% 40% vertical](https://www.ietf.org/media/images/ietf-logo.original.png)
    

---

## Where?
![bg right:80% 100% vertical](../../figures/uuid_fs.png)
![bg right:80% 100% vertical](https://logo-marque.com/wp-content/uploads/2020/04/Minecraft-Symbole-650x366.jpg)
![bg right:65% 100% vertical](https://www.volico.com/wp-content/uploads/2016/07/clustering-servers.jpg)

<!-- minecraft usese Version 4-->
---


## Combinations: UUID 4 

- $0.0947mm^3$ grain of sand
- UUID4 has 122 random bits, $5.3e36$
- $5.0191e34mm^3 =5.3e36 \cdot 0.0947mm^3$
- Volume of sand as UUID4 = $50,190,000,000,000,008km^3$

...and the volume of Jupiter 

- $1,431,281,810,739,360km^3$

![bg right:30% vertical ](https://starwalk.space/gallery/images/jupiter-guide/1140x641.jpg)
![bg right:30%](https://media.npr.org/assets/img/2012/09/13/6855916100_7c475796f3_b-30181951c4cd30708afa145ce7ec026266caeaea-s800-c85.webp)


<!--
50 quadrillion, 190 trillion and 8

1 quadrillion 434 trillion 281 billion 810 million 739 thousand and 360
-->

---

## Uniqueness: UUID4

- In the version 4, 6 bits are fixed and the remaining 122 bits are randomly generated, for a total of $2^{122}$ possible UUIDs.
- $n = 2^{122}$
- So if the number of generated UUIDs exceeds $r > n$ then there must be duplicates

- If you assume perfect randomness you would expect to see collison after $2^{61}$
- $2^{58} \approx 24,913,440,000,000,000 =7.2e9\cdot 365 \cdot 24\cdot 60 \cdot 60$
- After a few years you would get the first collisions.

<!--
The first UUID can be any of n possibilities, the second can be any of the n except the first (n-1), the third can be any except for the first two (n-2), and so on.

And the total number of ways to generate r UUIDs is n^r since each of the r UUIDs has n different possibilities. 

24 quadrillion 943 trillion 440 billion 
-->

---

## UUID 1

- combination of:
 
  -  current time and date.
     - RFC 4122 60-bit count of 100$ns$  since  00:00:00:00 15 October 1582 to 01/01/1970 
     - $122192928000000000ns$
     - Current date time since 00:00:00:00 01 January 1970

$$139285730270000000 = 17092802070000000 + 122192928000000000$$

  - 48-bit MAC address of the host machine

<!--
Gregorian Calendar 15/10/1582

- The Gregorian calendar, also known as the Western calendar, is the most widely used calendar in the world today. Its predecessor, the Julian calendar, was replaced because it did not correctly reflect the actual time it takes the Earth to circle once around the Sun, known as a tropical year.

Unix 01/01/1970

- The year 2038 problem is related to Unix time because times after 03:14:07 UTC on 19 January 2038 will require computers to store the value as greater than 32-bits.
-->
---
## Epochs/Time

- 01/01/1970
  - Unix engineers set the arbitrary datetime stamp because... it was convenient...
-  19/01/2038 03:14:07 the storage for 32-bit will become obsolete, as the value will be too large
   - Will need to migrate to 64-bit or just deal with the timestamp showing:
      - 19/01/1901 03:14:08
  
![bg right:40% 100%](../../figures/y2k.png)
![bg right: 40% 100% vertical](https://www.explainxkcd.com/wiki/images/c/c1/y2k_and_2038_2x.png)

  <!--

   Years designed as two digits not four.

  In January, a World Bank report estimated that only 21 of 139 developing countries had taken concrete steps to address the year 2000 problem. The report went on to anticipate year 2000 impacts on power, telecommunications, energy, food distribution and medical care in developing countries

   hundreds of billions of dollars spent to kill off the bug worldwide, Y2K ended as mere only glitches.

  -->

---

## UUID 1: Time format

<div style="font-size:27px">

|Name| Bytes|Hex|Bits|Comments|
|---|----|----|----|---|
|time_low|4|8|32|integer giving the low 32-bits of time|
|time_mid|2|4|16|integer giving the middle 16-bits of time|
|time_hi+version|2|4|16| 16 bits of time high with bits 6-7 multiplexed with version number|
|clock_seq_hi_and_res clock_seq_low|2|4|16|1 to 3-bit "variant" in the most significant bits, followed by the 13 to 15-bit clock sequence|

</div>

---
## Example

1. Current$^*$ timestamp in Unix Epoch Time (ns)  = $1709280207346745902$ .

2. Divide the timestamp by 100 to convert it to 100-nanosecond intervals:

<div align=center>
                           
$17092802073467459 = \frac{1709280207346745902}{100}$
</div>

3. Add the number of 100-nanosecond intervals between the UUID epoch (1582-10-15) and the Unix epoch (1970-01-01): 

<div align=center>

$139285730273467459 = 17092802073467459 + 122192928000000000$
</div>

<div style="font-size:20px">

$^*$ at the time of making the slide
</div>

---

## Example Continued...

Breaking down the UUID components as follows:

4. Time Low (32 bits): The first 32 bits of the timestamp in hexadecimal:

    ```
    $ printf "0x%08X\n" 1392857302
    > 0x530550D6
    ```

5. Time Mid (16 bits): The next 16 bits of the timestamp in hexadecimal:
    ```
    $ printf "0x%04X\n" 7346
    > 0x1CB2
    ```

6. Time High and Version (16 bits): The next 16 bits of the timestamp ($7459$) with the version (1) in hexadecimal: $0x1D24 = 0x1D23+1$

    ```
    $ printf "%04X\n" <<< echo $((7459+1))
    > 0x1D24
    ```

---

## Example Continued....

7. Clock Sequence (14 bits), in truth this can be 14 random bits so: 
   
   ```
   $ printf "%04X\n" <<< echo $((RANDOM % 16384))
   > 21FF
   ```

8. Node (48 bits): A randomly generated 48-bit value or MAC address if you must:
   
   ```
   $ dd if=/dev/urandom bs=1 count=6 2>/dev/null | od -An -tx1 | tr -d ' \n'
   > 2876c5202c7f
   ```

9. Put it all togehter:

   - timeLow - timeMid - timeHigh+version - clockSeq - Node
  
   - `530550D6-1CB2-1D24-21FF-2876C5202C7F`


   
   

<!--
16384 because 2^14
-->

---

## UUID 2

- Distributed Computing Environment (DCE)

- combination of:

  - Current time and date.

  - The local identifier replaces the lower 32 bits of the timestamp.48-bit M1392857302AC address of the host machine

    - Domain Name or Hostname
      
      ```sh
      $ id -u; id -g; whoami;
      ```

    - MacAddress or random generated Hex ->  ```sh1392857302```
---
## UUID 3

- namespace could be website, DNS information, plain text, etc
- the namespace value is hashed using the `md5hash` alogrithm
- GNU Coreutils implements this using `md5sum`

  ```
  $ md5sum <<< "Test"
  > 2205e48de5f93c784733ffcca841d2b5  -
  ```

![](https://www.simplilearn.com/ice9/free_resources_article_thumb/md5_1-MD5_Algorithm.PNG)

<!--md5sum needs to be stripped of whitespace and `-` -->

---

## MD5 Algorithm

![vertical](https://www.simplilearn.com/ice9/free_resources_article_thumb/md5_3-MD5_Algorithm.PNG)
![](https://www.simplilearn.com/ice9/free_resources_article_thumb/md5_4.PNG)

---

## MD5 Alogrithm

![bg right:50% 100%](https://www.simplilearn.com/ice9/free_resources_article_thumb/md5chart.PNG)

- Round 1: (b AND c) OR ((NOT b) AND (d))

- Round 2: (b AND d) OR (c AND (NOT d))

- Round 3: b XOR c XOR d

- Round 4: c XOR (b OR (NOT d))

<!--
Each 512-bit block gets broken down further into 16 sub-blocks of 32 bits each. There are four rounds of operations, with each round utilizing all the sub-blocks, the buffers, and a constant array value. 

This constant array can be denoted as T[1] -> T[64].

Each of the sub-blocks are denoted as M[0] -> M[15].
-->
---

## UUID​4


1. Generate 128 random bits:

```sh
$ dd if=/dev/random count=16 bs=1 2> /dev/null | xxd -ps
> 7c1e598398eb691f3f4be4123c3ce9a7
```

<div align=center>

[0]0111110 00001111 00101100 11000001 11001100 01110101 **10110100** 100011111 **00111111** 01001011 11100100 00010010 00111100 00111100 11101001 10100111

</div>
    
2. Take the 7th byte and perform an AND operation with `0x0F` to clear out the high nibble. Then, OR it with `0x40` to set the version number to 4.

<div align=center>

00000100  = **10110100** & 00001111​ (0x0f)

01000100  = **00000100** |  01000000 (0x40)

</div>


<!--


Command
- dd == data defintion
arguments 
- if == read from FILE instead of stdin
- count == Copy N blocks
- bs == read/write byes 1 at a time
- 2> errors redirected to blackhole
Command
- xxd == hexdump
  - ps == plain text from beginnning of stream
-->

---

## UUID4 Example

3. Next, take the 9th byte (**00111111**) and perform an AND operation with `0x3F` and then OR it with `0x80`.

<div align=center>

00111111​  = **00111111​** & 00111111​ (0x3f)

100111111  = **00111111​** |  10000000 (0x80)

</div>


1. Convert the 128 bits to hexadecimal representation and insert the hyphens to achieve the canonical text representation.​

<div align=center>

Before:  7C1E5983-98EB-691F-3f4B-E4123C3CE9A7

After:   7C1E5983-98EB-**44**1F-**CF**4B-E4123C3CE9A7
</div>

---

## Your Turn

<div align=center>

10101110 00100001 10110100 11111100 01101111 01110010 **10100011** 00110010 **10111010** 10000110 11010010 00001001 11010001 11100000 10101111 01101001 ​

</div>​

2. Take the 7th byte and perform an AND operation with `0x0F` to clear out the high nibble. Then, OR it with `0x40` to set the version number to 4.​

3. Next, take the 9th byte and perform an AND operation with `0x3F` and then OR it with `0x80`.​

4. Convert the 128 bits to hexadecimal representation and insert the hyphens to achieve the canonical text representation.​

<details>
<summary>Answer</summary>

<div align=center>

Before: AE21B4FC-6F72-A332-BA86-D209D1E0AF69

After: AE21B4FC-6F72-**43**32-**BA**86-D209D1E0AF69

</div>
</details>

---

## UUID 5

<div style="font-size:22px">

- namespace could be a website, DNS information, plain text, etc
- the namespace value is hashed using the `sha1` alogrithm
- GNU Coreutils implements this using `sha1sum`

  ```
  $ sha1sum "Test"
  > 1c68ea370b40c06fcaf7f26c8b1dba9d9caf5dea  -
  ```

![bg right:40% 100%](../../figures/sha1sum.png)

<!--sha1sum generates more characters than needed so we must trim, usually from right hand side-->