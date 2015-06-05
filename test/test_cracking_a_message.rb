class CrackingAMesssage < Minitest::Test
  def assert_can_crack(message)
    map         = Enigma.default_character_map
    encrypted   = Enigma.new(message, [1, 4, 24, 80], map).encrypt
    cracked     = Enigma.crack(encrypted, map)
    assert_equal message, cracked
  end


  def test_it_cracks_a_message_of_0_mod_4
    assert_can_crack 'abcde..end..'
  end

  def test_it_cracks_a_message_of_1_mod_4
    assert_can_crack 'abcdef..end..'
  end

  def test_it_cracks_a_message_of_2_mod_4
    assert_can_crack 'abcdefg..end..'
  end

  def test_it_cracks_a_message_of_3_mod_4
    assert_can_crack 'abcdefgh..end..'
  end
end
