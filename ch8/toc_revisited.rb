#!/usr/bin/env ruby

toc_width = 80
ch_num_width = 3
ch_title_width = 63
chapter_label = "Chapter"

chapters = []
chapters.push([1, "Getting Started", "1"])
chapters.push([2, "Numbers", "9"])
chapters.push([3, "Letters", "13"])

puts("Table of Contents".center(toc_width))
puts

chapters.each_with_index do |chapter, idx|
  print chapter_label + (idx + 1).to_s.rjust(ch_num_width) + ":  "
  puts chapter[1].ljust(ch_title_width) + "page" + chapter[2].rjust(3)
end