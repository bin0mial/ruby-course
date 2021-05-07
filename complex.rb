# frozen_string_literal: true

# ComplexNumber Calculator
class ComplexNumber
  @@state = { '+' => 0, '*' => 0 }
  attr_reader :real, :imagine

  def initialize(real, imagine)
    @real = real
    @imagine = imagine
  end

  def +(other)
    @@state['+'] += 1
    ComplexNumber.new real + other.real, imagine + other.imagine
  end

  def *(other)
    @@state['*'] += 1
    ComplexNumber.new (real * other.real) - (imagine * other.imagine), (real * other.imagine) + (imagine * other.real)
  end

  def self.bulk_add(cns)
    cns.reduce(:+)
  end

  def self.bulk_multiply(cns)
    cns.reduce(:*)
  end

  def to_s
    if imagine != 0
      "#{real}#{imagine.positive? ? '+' : ''}#{imagine}i"
    else
      real.to_s
    end
  end

  def self.get_stats
    @@state
  end

end

c1 = ComplexNumber.new 1, -2
c2 = ComplexNumber.new 1, 3
c3 = c1 + c2
c4 = c1 * c2

# Addition
puts 'Addition: ', c3

# Multiplication
puts 'Multiplication: ', c4

# Bulk_add
puts 'Bulk_add: ', ComplexNumber.bulk_add([c1, c2])

# Bulk_multiply
puts 'Bulk_multiply: ', ComplexNumber.bulk_multiply([c1, c2])

# Get_Stats
puts 'Get_Stats: ', ComplexNumber.get_stats
