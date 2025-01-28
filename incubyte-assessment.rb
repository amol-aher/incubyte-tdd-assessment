class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.to_i
  end
end

require 'minitest/autorun'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string_returns_zero
    assert_equal 0, @calculator.add("")
  end

  def test_single_number
    assert_equal 1, @calculator.add('1')
  end

  def test_two_numbers
    assert_equal 4, @calculator.add('1, 3')
  end
end