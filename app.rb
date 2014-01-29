require 'pry'
require 'rainbow'

require_relative 'paragraph'
require_relative 'sentence'

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

def make_paragraph(paragraph)
  input_words = paragraph.input_words
  num_of_words = paragraph.num_of_words
  paragraph.cleanup_input(input_words).create_all_the_words(num_of_words)
end

def print_lorem(input_words, num_of_words)
  paragraph = Paragraph.new(input_words, num_of_words)
  make_paragraph(paragraph)
  create_sentece(paragraph).push_remainder.print
end

puts "Hello and welcome"#.color(:yellow)
puts "Input the words you want to Lorem"#.color(:yellow)
input_words = gets.chomp!
puts "How many words do you want to print out?"#.color(:yellow)
num_of_words = gets.chomp!.to_i

print_lorem(input_words, num_of_words)




