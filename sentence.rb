require 'pry'

class Sentence

  attr_reader :words

  def initialize
    @words = []
  end

  def valid?(words_to_check)
    checker = words_to_check.map do |word|
      @words.include?(word)
    end
    checker.uniq.length == 1 ? checker.uniq.first : false
  end

  def present
    @words.first.capitalize!
    @words << '.'
    self
  end

  def to_string
    print @words.join(' ').gsub(' .', '. ').color(:green)
  end

end