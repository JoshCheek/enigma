class TestDefaultCharacterMap < Minitest::Test
  def test_it_isthe_lowercase_letters_then_the_numbers_then_a_space_period_and_comma
    letters  = ('a'..'z').to_a
    numbers  = ('0'..'9').to_a
    others   = [' ', '.', ',']
    expected = letters + numbers + others
    actual   = Enigma.default_character_map
    assert_equal expected, actual
  end
end
