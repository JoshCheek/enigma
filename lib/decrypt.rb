require 'what_weve_got_here_is_an_error_to_communicate'
require 'date'
require_relative 'enigma'

# read the input file
input_filename    = ARGV[0]
encrypted_message = File.read input_filename

# magic decryptiony shit
key       = ARGV[2] # 68403
date      = ARGV[3] # 040615
rotations = Enigma.rotations_for key
offsets   = Enigma.offsets_for date
map       = Enigma.default_character_map
enigma    = Enigma.new encrypted_message, rotations, offsets, map

# write the output file
output_filename = ARGV[1]
File.write output_filename, enigma.decrypt

# print the file, key, and date
puts "Created #{output_filename.inspect} with the key #{key} and date #{date}"
