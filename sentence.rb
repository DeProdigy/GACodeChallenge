require 'pry'

class Sentence

  attr_reader :words

  def initialize
    @words = []
  end

  #check if the sentence contains all of the inputed words in it
  def valid?(words_to_check)
    checker = words_to_check.map do |word|
      @words.include?(word)
    end
    checker.uniq.length == 1 ? checker.uniq.first : false
  end

  #capitalize the sentence and end it with a period
  def present
    @words.first.capitalize!
    @words << '.'
    self
  end

  #print out the output with the proper period placement
  def to_string
    print @words.join(' ').gsub(' .', '. ')#.color(:green)
  end

end