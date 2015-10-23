Test Example Using Minitest
===========================

This is a step by step example showing how to create a minimal, yet
well structured basic ruby project incorporating unit testing. 

The purpose of our project is to create a Scanner class that moves 
a value back and forth through a range. Something like this would 
be useful when implementing the vision module for a Cylon Centurian.

Create Your Project Directory Structure
---------------------------------------

The common convention for simple Ruby projects is to manage your
various source files in multiple directories. 

	mkdir -p scanner/{bin,lib,test}

The lib directory will contain the source code that solves the 
problem. The bin directory should contain the code that 'runs' 
your code. Often this is a simple command line shell that then
invokes the code you have created in the lib directory. The 
test directory will contain the unit tests that will exercise and
verify the code you created in lib.

Start Coding
------------

Create a file in your lib folder and code the initial version of 
your object. For example lib/scanner.rb:

	class Scanner

	  def initialize()
	    @current = 1
	  end
	  
	  def scan
	    @current
	  end

	end

Create a Test
-------------

The unit testing framework we're using for this example is 'minitest'. 
If you are running version 1.9 then you already have minitest installed, since it is bundled in with the standard ruby installation. If you are on a newer version of ruby, you will need to install the gem (use sudo if necessary, depending on how your system is setup and what OS you are using):

	gem install minitest

Now create your first test in the file test/test_scanner.rb:

	require 'minitest/autorun'
	require 'scanner'

	class TestScanner < MiniTest::Unit::TestCase

		def test_initial_scan
		    s = Scanner.new
		    assert_equal(s.scan, 1, "The initial scan should be 1")	
		end

	end

Run Your Tests
--------------

Notice the first line of our test file, 'minitest/autorun' will 
add some functionality that will look at our test code and 
run the methods starting with 'test_' as tests. You will add additional
methods with the 'test_' prefix to this class. Collectively, these 
are referred to as a test case.

In order to run our test case, we'll need to invoke ruby on the
command line (later, we'll automate this with rake). We'll 
use the -I option to add the lib directory to
the ruby library search path, so our test code can include 
the scanner.rb code as required on line 3. Note that this command is 
executed in the root of your project:

	ruby -Ilib test/test_scanner.rb

Over time, you will likely create multiple test cases. Manually 
building a command line to include all of the test cases 
can quickly become tedious. Thankfully, ruby comes with build 
management tool called rake. Rake allows you to automate many build process
activities and workflows. It also comes with TestTask
class that lets you easily setup a task to run your tests. Create
the Rakefile in the root of your project:

	require 'rake/testtask'

	Rake::TestTask.new do |t|
	end

By default, this creates a new task named 'test' and will add 
the lib directory to the execution path, and search the test
directory for all tests. We can now run our tests as follows:

	rake test

Lets make sure that our rake task really will automatically
pickup additional test cases. Create test/test_advanced_scanner.rb:

	require 'minitest/autorun'
	require 'scanner'

	class TestAdvancedScanner < MiniTest::Unit::TestCase

	  def test_explicit_start
	    s = Scanner.new(10)
	    assert_equal(10, s.scan, "Initial scan should match the initialized value")
	  end

	  def test_explicit_end
	    s = Scanner.new(10, 12)
	    assert_equal(10, s.scan, "Initial scan should match the initialized value")
	    assert_equal(11, s.scan)
	    assert_equal(12, s.scan, "Max scan should match initialized end value")
	    assert_equal(11, s.scan, "Reverse after reaching initialized end value")
	  end
	end

Creating a helper file in test/test_helper.rb provides a convenient
place for any other 'helper' type code that may cut accross
various test cases, as well as any other configuration 
or enhancements to the minitest framework. For example, lets add the minitest-reporter gem to our project to provide some more appealing test output. 
First, install the minitest reporters gem:

	gem install minitest-reporters

Now add the code to our test/test_helper.rb file in include and initialize 
the reporter functionality:

	require "minitest/reporters"
	Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new

Now your should be able to run 'rake test' and all 5 test methods should
be invoked (and fail). Then you can start enhancing the Scanner class
to 'turn them green'.

Resources
---------

[Programming Ruby 1.9 & 2.0, Chapter 13 Unit Testing and Chapter 16 Namespaces, Source Files and Distribution](http://pragprog.com/book/ruby4/programming-ruby-1-9-2-0)

[Minitest Documentation Site](http://docs.seattlerb.org/minitest/)

[Rake TestTask Documentation](http://rake.rubyforge.org/classes/Rake/TestTask.html)

[Minitest Reporters](https://github.com/kern/minitest-reporters)


