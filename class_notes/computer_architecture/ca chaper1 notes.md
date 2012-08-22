On Ethan's recommendation, I started reading Computer Architecture, A Quantitative Approach. You can download a pdf version of it here:

[HTML]: http://scholar.googleusercontent.com/scholar?q=cache:wpz9c3jmq18J:scholar.google.com/&hl=en&as_sdt=0,5

[PDF]: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.115.1881&rep=rep1&type=pdf

#### Preface

On page xv, the author says that intel will switch to "relying on multiple proces- sors or cores per chip for high-performance designs." [1]

	"If you want your program to run significantly faster, say, to justify the addition of new features, you’re going to have to parallelize your program."

# 1. Fundamentals Of Computer Design

## 1.1 Introduction

Lots of different forces lead to modern computers being cheap. Ex:
- The growth rates of microprocessors and integrated curcuits
- The cost advantage of mass producing microprocessors

And several forces made new computer architectures cheaper, too:
- The elimination of programming in assembly code (compiled languages?).
- The emergance of open source operating systems like Unix and Linux.

From 1986 to 2002, processor performance rose 52% year over year, lead by innovations in Instructional Level Parallelism(irp) by architectures like RISC and x86.

The acceleration of processor speed due to IRC stagnated, and Intel joined IBM and Sun in switching to having multiple processors per chip rather than faster uniprocessors. The focus now is on thread-level parallelism(tlp) and dala-level parallelism(dlp), where programmers write code that does more in parallel to get better performance.

## 1.2 Classes of Computers




## Annotations
[1] http://paulgraham.com/ambitious.html, PG's 6th idea here explains this too.