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

  def encrypt
    chunk_rotate &:+
  end

  def decrypt
    chunk_rotate &:-
  end

  private

  def chunk_rotate(&rotator)
    chunkify(@message).map { |chunk| rotate_chunk chunk, &rotator }.join
  end

  def chunkify(message)
    message.chars.each_slice(4)
  end

  def rotate_chunk(chunk, &rotator)
    chunk.map.with_index do |char, index|
      rotate_char char, @offsets[index], &rotator
    end
  end

  def rotate_char(character, offset, &rotator)
    rotation = rotator.call(@map.index(character), offset)
    @map.rotate(rotation).first
  end
end
