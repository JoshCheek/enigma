class Enigma
  def self.random_key
    Array.new(5) { random_character }.join
  end

  def self.random_character
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample
  end

  def self.chunk(message)
    message.chars.each_slice(4).map(&:join).to_a
  end

  def self.default_character_map
    letters  = ('a'..'z').to_a
    numbers  = ('0'..'9').to_a
    others   = [' ', '.', ',']
    letters + numbers + others
  end

  def initialize(unencrypted_message, key, date)
    @unencrypted_message = unencrypted_message
    @key                 = key
    @date                = date
  end

  def encrypt
    # turn my message into chunks
    chunks = @unencrypted_message.chars.each_slice(4).to_a

    # encrypt each chunk
    encrypted_chunks = chunks.map { |chunk| encrypt_chunk chunk }

    # join my chunks
    encrypted_chunks.join
  end

  private

  def encrypt_chunk(chunk)
    date_square = (@date.to_i ** 2).to_s
    offsets     = date_square[-4..-1]

    chunk.map.with_index { |char, i|
      encrypt_char char, @key[i..i+1].to_i, offsets[i].to_i
    }
  end

  def encrypt_char(character, rotation, offset)
    unencrypted_index = Enigma.default_character_map.index character
    encrypted_sum     = unencrypted_index + rotation + offset
    encrypted_index   = encrypted_sum % Enigma.default_character_map.length
    Enigma.default_character_map[encrypted_index]
  end
end
