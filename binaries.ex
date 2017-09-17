#strings are binaries
#default encoding: utf-8

bytes = <<97, 98, 99>>
IO.puts(byte_size(bytes)) #3 bytes of 8 bits
IO.puts(byte_size("abc")) #3

#special chars?
bytes = <<255, 256 :: utf8, 345 ::utf8>>
IO.puts(byte_size(bytes)) #5 due of codes > 255 are written on (1 + x/256) bytes

#bitstring
IO.puts(is_bitstring(<<1 :: size(10000)>>)) #true 1 byte only on X bits

#valid binaries: true when sum of the bits are divisible by 8
IO.puts(is_binary(<<1 :: size(1), 1 :: size(7)>>)) #true
IO.puts(is_binary(<<1 :: size(5)>>)) #false

#charlist

charlist = 'under_simple_quote'
string = "under_double_quote"
IO.inspect([is_list(charlist), is_list(string)]) #true, false

#concatenation

IO.puts("this is " <> "string concatenation: " <> <<97, 98, 99>>) #this is string concatenation abc