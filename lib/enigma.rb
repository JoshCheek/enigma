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

  def self.crack(encrypted, map)
    *, second_to_last, last = chunkify(encrypted)
    encrypted_chunk, known_chunk =
      case last.length % 4
      when 0 then [last,           ['n', 'd', '.', '.']]
      when 1 then [second_to_last, ['e', 'n', 'd', '.']]
      when 2 then [second_to_last, ['.', 'e', 'n', 'd']]
      when 3 then [second_to_last, ['.', '.', 'e', 'n']]
      end

    offsets = known_chunk.zip(encrypted_chunk).map do |known_val, enc_val|
      find_offset map, known_val, enc_val
    end

    Enigma.new(encrypted, offsets, map).decrypt
  end

  def self.find_offset(map, first, second)
    map.index(second) - map.index(first)
  end

  def self.chunkify(message)
    message.chars.each_slice(4).to_a
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
    Enigma.chunkify(@message).map { |chunk| rotate_chunk chunk, &rotator }.join
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
