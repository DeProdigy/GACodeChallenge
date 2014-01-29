require 'pry'
require 'rainbow'

require_relative 'paragraph'
require_relative 'sentence'

#create each sentence where every single word is being used in it at least once
#keep creating new sentences while there are enough unique words remaining for the new valid sentence
def create_sentece(paragraph)
  until paragraph.total_words.uniq.length < paragraph.words_array.length
    sentence = Sentence.new
    until sentence.valid?(paragraph.words_array)
      sentence.words << paragraph.total_words.shift
    end
    paragraph.all_sentences << sentence
  end
  paragraph
end

#clean up the paragraph and seed it with words
def make_paragraph(paragraph)
  input_words = paragraph.input_words
  num_of_words = paragraph.num_of_words
  paragraph.cleanup_input(input_words).create_all_the_words(num_of_words)
end

#main function that runs all of the other functions
def print_lorem(input_words, num_of_words)
  #create a new paragraph
  paragraph = Paragraph.new(input_words, num_of_words)
  make_paragraph(paragraph)
  #create sentences for the paragraph, with the remaining words in the last sentence and print it out
  create_sentece(paragraph).push_remainder.print
end

#run the input menu
puts "Hello and welcome"#.color(:yellow)
puts "Input the words you want to Lorem"#.color(:yellow)
input_words = gets.chomp!
puts "How many words do you want to print out?"#.color(:yellow)
num_of_words = gets.chomp!.to_i

#trigger print_lorem to start the function
print_lorem(input_words, num_of_words)




