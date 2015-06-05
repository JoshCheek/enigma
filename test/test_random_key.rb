require_relative '../lib/enigma'

class TestRandomKey < Minitest::Test
  def assert_digit(char)
    assert_equal char, char.to_i.to_s
  end

  def test_the_key_is_five_digits_like_41521
    random_key = Enigma.random_key
    assert_equal 5, random_key.length
    assert_digit random_key[0]
    assert_digit random_key[1]
    assert_digit random_key[2]
    assert_digit random_key[3]
    assert_digit random_key[4]
  end

  def test_each_key_is_random
    skip 'implement me!'
  end

  def test_a_digit_is_0_9
    skip 'implement me!'
  end
end
