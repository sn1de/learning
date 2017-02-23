single = 'A lot of ruby standards use single quotes as the preferred default'
puts single

single_quotes = 'A lot of ruby standards use single \'quotes\' as the preferred default'
puts single_quotes

# using double quotes lets you easily use single quotes

sarcasm = "Yea, I really 'like' creating change orders."
puts sarcasm

# even more handy, ruby lets you use several different delimiters easily
# paired delimeters are the easiest to read, I prefer {}, but non-paired, like : are available

sarcasm_quote = %q{Brad said, "I really 'like' creating change orders."}
puts sarcasm_quote

curly_braces = %q:You can use {} as string delimeters.:
puts curly_braces

v = "values"
interpolation = "I can put #{v} into a string"
puts interpolation

append = 'I can put ' + v + ' into a string'
puts append

long = "This is a very, " + 
       "very, " +
       "super long string"

puts long

long_here = <<-EOS
This is a very,
very,
super long string
EOS



puts long_here

sum = 1 + \
      99 + \
      50

puts sum

concated = "This" \
  " and " \
  "this."

puts concated

concated2 = "This" " and " "this."

puts concated2
