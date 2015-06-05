class TestDefaultCharacterMap < Minitest::Test
  def test_it_isthe_lowercase_letters_then_the_numbers_then_a_space_period_and_comma
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","],
                 Enigma.default_character_map
  end
end
