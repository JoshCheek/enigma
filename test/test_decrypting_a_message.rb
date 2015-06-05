class DecryptingAMessage < Minitest::Test
  def test_it_encrypts_a_fucking_message_ffs
    message   = 'fmotmfzwptg'
    decrypted = 'hello world'
    date      = '040615'
    key       = "68403"
    offsets   = Enigma.offsets_for(date)
    rotations = Enigma.rotations_for(key)
    map       = Enigma.default_character_map
    enigma    = Enigma.new message, rotations, offsets, map
    assert_equal decrypted, enigma.decrypt
  end
end
