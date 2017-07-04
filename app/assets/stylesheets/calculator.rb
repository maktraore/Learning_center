require 'rspec'

class Calculator
  def add(number_one, number_two)
    return number_one + number_two
  end

  def subtract(number_one, number_two)
    return number_one - number_two
  end

  def multiply(number_one, number_two)
    return number_one * number_two
  end

  def divide(dividend, divisor)
    return dividend / divisor
  end

  def sqaure(number)
    return square * square
  end

  def power(number, exponent)
    return number ** exponent
  end

  def self.foobar
  end
end

RSpec.describe Calculator do
  describe "#add" do
    it "should return the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(1, 3)).to eq(4)
    end
  end

  describe "#subtract" do
    it "should return the difference between two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(3,1)).to eq(2)
    end

    it "should return a negative number if the second number is larger" do
      calculator = Calculator.new
      expect(calculator.subtract(1,3)).to eq(-2)
      expect(calculator.subtract(1,3)).to_not eq(2)
    end
  end

  # describe ".foobar" do
  # end
end