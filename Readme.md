Enigma
======

BDD - Why we're here
--------------------

This is for the edification students,
so they can compare how I solved this problem that they just worked on.
And provide an example they can attempt to mimic, to gain experience noticing what I notice,
and making the decisions I make.


BDD - Process
-------------

### Encryption

```
$ cat message.txt
hello world

$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 68403 and date 040615

$ cat encrypted.txt
fmotmfzwptg
```


Notes
-----

```
BDD: Behaviour Driven Development
  Get your head in the right spot
    Figure out who is this for?
    What is their goal?
    How does this address that goal?

  Process:
    Ignore what does and doesn't exist, and imagine a world where I achieve my goal
    now what does it look like
    That's my first test
    When that thing passes legitimately, then I've achieved my goal. Ship it!

BDD / TDD (Test Driven Development)
  Smaller focused tests
  Describe what this thing (whatever it is) does, in human words
  If it does everything in that description, then it works
  Each things I describe is a test

TDD
  While writing these unit tests, pay attention to why it's hard to test
  Those things need to be removed or abstracted away from the code
  Which will make it easy to test
  And improve its design
  How?
    Push that thing higher in the callstack
    eg we receive a specific time Time object rather than calling Time.now
```
