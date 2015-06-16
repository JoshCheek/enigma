[Enigma](http://tutorials.jumpstartlab.com/projects/enigma.html)
================================================================

Videos of the implementation:
-----------------------------

* [All videos](https://vimeo.com/channels/joshenigma), as a playlist
* [High level](https://vimeo.com/130885075) (BDD / TDD / starting from the outside)
* [Random key generation](https://vimeo.com/130885076) (TDD)
* [Figuring out the algorithm](https://vimeo.com/130885077) (also shows how I use SiB)
* [Implementing Encrypt](https://vimeo.com/130885074)
* [Refactoring](https://vimeo.com/130882701) ([before](http://bit.ly/1L1A1xY) and [after](http://bit.ly/1KJk5m1))
* [Decrypting](https://vimeo.com/130882444)
* Cracking (video not yet edited)


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


### Decryption

```
$ cat encrypted.txt
fmotmfzwptg

$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 68403 040615
Created 'decrypted.txt' with the key 68403 and date 040615

$ cat decrypted.txt
hello world
```


### Crack

Turns out we don't need the date, there's only 39 possibilities for each of the characters.
And we know which one it is! (just the difference between the encrypted
value and the known value (known via `..end..`))
So figure out what the known value is and calculate it.
Then, decrypt based on that.

```
$ echo -n 'hello worldslkdj jjjjjj..end..' > message.txt

$ ruby lib/encrypt.rb message.txt encrypted.txt
Created "encrypted.txt" with the key 31937 and date 050615

$ cat encrypted.txt
hz2oosarr6uvl5um 40mj40b.z4g.t⏎                                                                                                                                                  05:48 AM   ~/deleteme/josh-enigma   master

$ ruby lib/crack.rb encrypted.txt cracked.txt

$ cat cracked.txt
hello worldslkdj jjjjjj..end..⏎                                                                                                                                                  05:48 AM   ~/deleteme/josh-enigma   master
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
