class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter, numbers = numbers.match(%r{//(.)\n(.*)}).captures
      numbers.split(/#{delimiter}/).map(&:to_i).sum
    else
      numbers.split(/,|\n/).map(&:to_i).sum
    end
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

  def test_any_amount_of_numbers
    assert_equal 6, @calculator.add('1, 4, 1')
  end

  def test_newline_delimiters
    assert_equal 8, @calculator.add("1\n4,3")
  end

  def test_custom_delimiter_support
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_exception_raised_on_negative_number
    exception = assert_raises(RuntimeError) { @calculator.add("1, -5") }
    assert_equal "negative numbers not allowed: -5", exception.message
  end
end