class TestSomeOfThisShit < Minitest::Test
  def test_default_character_map_isthe_lowercase_letters_then_the_numbers_then_a_space_period_and_comma
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","],
                 Enigma.default_character_map
  end

  def assert_chunks(message, expected)
    assert_equal expected, Enigma.chunk(message)
  end

  def test_chunks_every_four_characters_together
    assert_chunks "",   []
    assert_chunks "a",  ["a"]
    assert_chunks "abcd", ["abcd"]
    assert_chunks "1234567890123456789",
                  ["1234", "5678", "9012", "3456", "789"]
  end

  def test_the_fucking_offsets
    assert_equal [8, 2, 2, 5], Enigma.offsets_for("040615")
  end

  def test_the_fucking_rotations
    assert_equal [68, 84, 40, 3], Enigma.rotations_for( "68403")
  end
end
