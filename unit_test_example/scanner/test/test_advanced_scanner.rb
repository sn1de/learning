require 'minitest/autorun'
require 'scanner'

class TestAdvancedScanner < MiniTest::Test

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