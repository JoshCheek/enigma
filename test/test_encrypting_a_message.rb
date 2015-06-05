class TestEncryptingAMessage < Minitest::Test
  # to encrypt a message:    ("hello world")
  #   get each of its chunks (["hell", "o wo", "rld"])
  #     chunks are every four characters from the unencrypted message
  #   then encrypt each chunk (["fmot", "mfzw", "ptg"])
  #   join them together     ("fmotmfzwptg")

  # to encrypt a chunk: (eg "hell")
  #   encrypt each character "fmot"

  # to encrypt a character:
  #   take each letter, (eg "h")
  #   find its unencrypted_index (eg 7)
  #   add the rotation and the offset
  #   mod the length of the character map to get the encrypted_index (eg 5)
  #   look up the encrypted character in the character map(eg "f")

  # the last four of the end of the squared date:
  #   date is 040615
  #   square it to get 1649578225
  #   take the last four 8225

  # offsets:
  #   the a offset is the fourth from the end of the squared date
  #     offset:   8
  #   the b offset is the fourth from the end of the squared date
  #     offset:   2
  #   the c offset is the fourth from the end of the squared date
  #     offset:   2
  #   the d offset is the fourth from the end of the squared date
  #     offset:   5


  # # key is 68403
  # rotations:
  #   the a rotation is the first two digits from the key
  #     rotation: 68 (first two digits of the key)
  #   the b rotation is the second two digits from the key
  #     rotation: 84 (first two digits of the key)
  #   the c rotation is the third two digits from the key
  #     rotation: 40 (first two digits of the key)
  #   the d rotation is the fourth two digits from the key
  #     rotation: '03'.to_i (first two digits of the key)

  # character map:
  #   the lowercase letters then the numbers then a space, period, and comma
  #   letters = ('a'..'z').to_a             # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  #   numbers = ('0'..'9').to_a             # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  #   others  = [' ', '.', ',']             # => [" ", ".", ","]
  #   all     = letters + numbers + others  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

  #   all        # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  #     .length  # => 39
end
