class TestEncryptingAMessage < Minitest::Test
  def test_it_encrypts_a_fucking_message_ffs
    message   = 'hello world'
    encrypted = 'fmotmfzwptg'
    date      = '040615'
    key       = "68403"
    offsets   = Enigma.offsets_for(date)
    rotations = Enigma.rotations_for(key)
    enigma    = Enigma.new message, rotations, offsets
    assert_equal encrypted, enigma.encrypt
  end
end
