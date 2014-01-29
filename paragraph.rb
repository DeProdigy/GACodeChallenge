require 'pry'

class Paragraph

  attr_accessor :words_array, :total_words, :all_sentences, :input_words, :num_of_words

  def initialize(input_words, num_of_words)
    @input_words = input_words
    @num_of_words = num_of_words
    @words_array = []
    @total_words = []
    @all_sentences = []
  end

  def cleanup_input(input_words)

    @words_array = input_words.gsub(', ', ' ').split(' ')
    self
  end

  def create_all_the_words(num_of_words)
    num_of_words.times do
      @total_words << @words_array.sample.clone
    end
    self
  end

  def push_remainder
    @all_sentences.last.words << @total_words
    @all_sentences.last.words.flatten!
    self
  end

  def print
    @all_sentences.each do |sentence|
      sentence.present.to_string
    end
    puts ''
  end

end



