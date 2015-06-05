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



  def initialize(message, key, date, map=Enigma.default_character_map)
    @map       = map
    @message   = message
    @key       = key
    @date      = date
    @offsets   = (@date.to_i ** 2).to_s[-4..-1].chars.map(&:to_i)
    @rotations = @key.chars.each_cons(2).to_a.map(&:join).map(&:to_i)
  end

  def encrypt
    chunkify(@message).map { |chunk| encrypt_chunk chunk }.join
  end

  private

  attr_reader :map, :offsets

  def chunkify(message)
    message.chars.each_slice(4)
  end

  def encrypt_chunk(chunk)
    chunk.map.with_index do |char, index|
      rotation  = @rotations[index]
      encrypt_char char, rotation, offsets[index]
    end
  end

  def encrypt_char(character, rotation, offset)
    unencrypted_index = map.index character
    encrypted_sum     = unencrypted_index + rotation + offset
    encrypted_index   = encrypted_sum % map.length
    map[encrypted_index]
  end
end
