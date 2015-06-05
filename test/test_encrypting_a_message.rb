class TestEncryptingAMessage < Minitest::Test
  def test_it_encrypts_a_fucking_message_ffs
    message   = 'hello world'
    encrypted = 'fmotmfzwptg'
    date      = '040615'
    key       = "68403"
    enigma    = Enigma.new message, key, date
    assert_equal encrypted, enigma.encrypt
  end
end
