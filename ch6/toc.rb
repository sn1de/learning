#!/usr/bin/env ruby

toc_width = 80
ch_num_width = 3
ch_title_width = 63
chapter = "Chapter"
puts("Table of Contents".center(toc_width))
puts
puts(chapter + 1.to_s.rjust(ch_num_width) + ":  " + "Getting Started".ljust(ch_title_width) + "page" + "1".rjust(3))
puts(chapter + 2.to_s.rjust(ch_num_width) + ":  " + "Numbers".ljust(ch_title_width) + "page" + "9".rjust(3))
puts(chapter + 3.to_s.rjust(ch_num_width) + ":  " + "Letters".ljust(ch_title_width) + "page" + "13".rjust(3))
