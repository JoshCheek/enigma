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

  def self.offsets_for(date)
    (date.to_i ** 2).to_s[-4..-1].chars.map(&:to_i)
  end

  def self.rotations_for(key)
    key.chars.each_cons(2).to_a.map(&:join).map(&:to_i)
  end

  def initialize(message, *offsetss, map)
    @map     = map
    @message = message
    @offsets = offsetss.transpose.map { |n| n.inject 0, :+ }
  end

  # Note to self: chunk rotate?
  def encrypt
    chunk_rotate :forward
  end

  def decrypt
    chunk_rotate :backward
  end

  def chunk_rotate(direction)
    chunkify(@message).map { |chunk| rotate_chunk chunk, direction }.join
  end

  private

  def chunkify(message)
    message.chars.each_slice(4)
  end

  def rotate_chunk(chunk, direction)
    chunk.map.with_index do |char, index|
      rotate_char char, @offsets[index], direction
    end
  end

  def rotate_char(character, offset, direction)
    if direction == :forward
      rotation = @map.index(character) + offset
    else
      rotation = @map.index(character) - offset
    end
    @map.rotate(rotation).first
  end
end
