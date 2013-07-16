#!/usr/bin/env ruby

max_bottles = 99
current_bottle = max_bottles
gone = "no more"

while current_bottle > 0 do
  print "#{current_bottle > 0 ? current_bottle : gone.capitalize} bottle#{'s' if current_bottle > 1} of beer on the wall, "
  puts "#{current_bottle  > 0 ? current_bottle : gone} bottle#{'s' if current_bottle > 1} of beer."
  current_bottle = current_bottle - 1
  print "Take one down and pass it around, #{current_bottle > 0 ? current_bottle : gone} "
  puts "bottle#{'s' if current_bottle != 1} of beer on the wall."
  puts
end

puts "#{gone.capitalize} bottles of beer on the wall, #{gone} bottles of beer."
puts "Go to the store and buy some more, #{max_bottles} bottles of beer on the wall."
