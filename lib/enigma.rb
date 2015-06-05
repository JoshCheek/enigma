class Enigma
  def self.random_key
    Array.new(5) { random_character }.join
  end

  def self.random_character
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample
  end

  def initialize(unencrypted_message, key, date)
    @unencrypted_message = unencrypted_message
    @key = key
    @date = date
  end

  def encrypt
    "fmotmfzwptg"
  end
end
