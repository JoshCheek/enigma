class TestEncryptingAMessage < Minitest::Test
  def assert_chunks(chunks, message)
    assert_equal chunks, Enigma.chunk(message)
  end

  def test_a_message_is_a_group_of_chunks_which_are_every_group_of_four_or_fewer_characters
    assert_chunks ["a"]                    ,  "a"
    assert_chunks ["abcd"]                 ,  "abcd"
    assert_chunks ["abcd", "e"]            ,  "abcde"
    assert_chunks ["abcd", "efgh", "ijkl"] ,  "abcdefghijkl"
    assert_chunks ["hell", "o wo", "rld"]  ,  "hello world"
  end

  def test_to_encrypt_a_message_we_encrypt_its_chunks_and_join_them_together
    skip
    key  = 68403
    date = 040615
    assert_encrypts key, date, "hello world", "fmotmfzwptg"
  end

  # uhhhhhhhhhhhhhhhhhh
  def test_to_encrypt_a_chunk_encrypt_each_characters # (eg "hell")
    skip
    #   then encrypt each chunk (["fmot",
    #   join them together     ("fmotmfzwptg")
    key  = 68403
    date = 040615
    chunk_encrypts_to key, date, "hell", "fmot"
    chunk_encrypts_to key, date, "o wo", "mfzw" # <--- is this right?
  end

  def test_it_can_encrypt_chunks_of_varying_length
    skip
    key  = 68403
    date = 040615
    chunk_encrypts_to key, date, "r",   "p"
    chunk_encrypts_to key, date, "rl",  "pt"
    chunk_encrypts_to key, date, "rld", "ptg"
  end

  def test_to_encrypt_a_character_get_its_character_at_its_encrypted_index_which_is_the_unencrypted_index_plus_the_rotation_plus_the_offset
    skip
    key  = 68403
    date = 040615
    chunk_encrypts_to key, date, "r",   "p"
  end
  # to encrypt a character:
  #   take each letter, (eg "h")
  #   find its unencrypted_index (eg 7)
  #   add the rotation and the offset
  #   mod the length of the character map to get the encrypted_index (eg 5)
  #   look up the encrypted character in the character map(eg "f")

  # anatomy of a chunk:
  #   the first character of a chunk is the a character
  #   the second character of a chunk is the b character
  #   the third character of a chunk is the c character
  #   the fourth character of a chunk is the d character

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

  # key is 68403
  # rotations:
  #   the a rotation is the first two digits from the key
  #     rotation: 68 (first two digits of the key)
  #   the b rotation is the second two digits from the key
  #     rotation: 84 (first two digits of the key)
  #   the c rotation is the third two digits from the key
  #     rotation: 40 (first two digits of the key)
  #   the d rotation is the fourth two digits from the key
  #     rotation: '03'.to_i (first two digits of the key)
end
