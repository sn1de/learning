require 'test_helper'
require 'scanner'

class TestScanner < MiniTest::Test

    def test_initial_scan
        s = Scanner.new
        assert_equal(1, s.scan, "The initial scan should be 1") 
    end

    def test_scanner_progression
      s = Scanner.new
      assert_equal(1, s.scan, "The initial scan should be 1") 
      assert_equal(2, s.scan, "The next scan should be 2") 
    end

    def test_scanner_oscillation
      s = Scanner.new
      assert_equal(1, s.scan, "The initial scan should be 1") 
      assert_equal(2, s.scan, "scan should be 2") 
      assert_equal(3, s.scan, "scan should be 3") 
      assert_equal(4, s.scan, "scan should be 4") 
      assert_equal(5, s.scan, "scan should be 5") 
      assert_equal(4, s.scan, "Should now be decreasing to 4") 
      assert_equal(3, s.scan, "scan should be 3") 
      assert_equal(2, s.scan, "scan should be 2") 
      assert_equal(1, s.scan, "scan should be 1") 
      assert_equal(2, s.scan, "and then go back up again to 2") 
    end

end