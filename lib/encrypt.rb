require 'what_weve_got_here_is_an_error_to_communicate'
require 'date'
require_relative 'enigma'

# read the input file
input_filename      = ARGV[0]
unencrypted_message = File.read input_filename

# magic encryptiony shit
key     = Enigma.random_key
date    = Date.today.strftime("%d%m%y") # "040615" # today's date, apparently
offsets = Enigma.offsets_for date
enigma  = Enigma.new unencrypted_message, key, offsets

# write the output file
output_filename = ARGV[1]
File.write output_filename, enigma.encrypt

# print the file, key, and date
puts "Created #{output_filename.inspect} with the key #{key} and date #{date}"
