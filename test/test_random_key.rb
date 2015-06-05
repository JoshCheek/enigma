require_relative '../lib/enigma'

class TestRandomKey < Minitest::Test
  def assert_digit(char)
    assert_equal char, char.to_i.to_s
  end

  def test_the_key_is_a_string_of_five_digits_like_41521
    random_key = Enigma.random_key
    assert_equal String, random_key.class
    assert_equal 5, random_key.length
    assert_digit random_key[0]
    assert_digit random_key[1]
    assert_digit random_key[2]
    assert_digit random_key[3]
    assert_digit random_key[4]
  end

  def test_each_key_is_random
    # if I call it a shitload of times I'l get at least 2 values
    keys = 1000.times.map { Enigma.random_key }
    assert 1 < keys.uniq.length
  end

  def test_a_digit_is_0_9
    digits_seen = 1000.times.map { Enigma.random_key }.join.chars
    all_digits  = digits_seen.uniq.sort.join
    assert_equal "0123456789", all_digits
  end
end
