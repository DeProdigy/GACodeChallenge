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
    #take out all of the commas from the input
    #return self for chaining
    @words_array = input_words.gsub(', ', ' ').split(' ')
    self
  end

  def create_all_the_words(num_of_words)
    #create the specified number of words that user inputs
    #clone every word so it does not point to the original source and overwrite it everywhere
    #return self for chaining
    num_of_words.times do
      @total_words << @words_array.sample.clone
    end
    self
  end

  def push_remainder
    #push the remainder words into the last sentence and flatten the array
    #return self for chaining
    @all_sentences.last.words << @total_words
    @all_sentences.last.words.flatten!
    self
  end

  def print
    #run Sentence's instance to_string which prints out each sentence
    @all_sentences.each do |sentence|
      sentence.present.to_string
    end
    #skip a line after the print out for a better terminal visual
    puts ''
  end

end



