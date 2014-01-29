require 'pry'
require_relative 'spec_helper'
require_relative '../paragraph'
require_relative '../sentence'

describe Paragraph do
  before :each do
    @paragraph = Paragraph.new('words, are here', 10)
    @paragraph.cleanup_input(@paragraph.input_words).create_all_the_words(@paragraph.num_of_words)
  end

  describe '#cleanup_input' do
    it "takes out the commas and splits on spaces of input" do
      expect(@paragraph.words_array).to match_array(['words', 'are', 'here'])
    end
  end

  describe '#create_all_the_words' do
    it 'should have the specified number of words' do
      expect(@paragraph.total_words.length).to eq 10
    end
  end

  describe '#push_remainder' do
    it 'shoves the remaining words into the last sentence' do
      @paragraph.all_sentences << Sentence.new
      @paragraph.all_sentences << Sentence.new
      first_sentence = @paragraph.all_sentences.first
      last_sentence = @paragraph.all_sentences.last

      # simulate two remaining words
      4.times do
        first_sentence.words << @paragraph.total_words.shift
      end

      4.times do
        last_sentence.words << @paragraph.total_words.shift
      end

      remainder = @paragraph.total_words.length
      length_before = last_sentence.words.length
      @paragraph.push_remainder
      #the remaining words plus the last sentence equals the last sentenct after the function
      expect(last_sentence.words.length).to eq remainder + length_before
    end
  end

end