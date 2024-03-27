require "virtuaaliviivakoodi/version"
require "virtuaaliviivakoodi/generator"

module Virtuaaliviivakoodi
  # Takes parameters and returns virtuaaliviivakoodi as a String.
  def self.generate(arguments = {})
    Generator.new(**arguments).call
  end

  def self.pad(value, wanted_length)
    value = value.to_s
    raise(ArgumentError, "Value is #{value.size} characters long, maximum being #{wanted_length}") if (value.size > wanted_length)

    value.rjust(wanted_length, "0")
  end
end

