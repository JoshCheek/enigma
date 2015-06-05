require 'what_weve_got_here_is_an_error_to_communicate'
require 'date'
require_relative 'enigma'

# read the input file
input_filename    = ARGV[0]
encrypted_message = File.read input_filename

# magic cracky shit
map     = Enigma.default_character_map
cracked = Enigma.crack(encrypted_message, map)

# write the output file
output_filename = ARGV[1]
File.write output_filename, cracked
