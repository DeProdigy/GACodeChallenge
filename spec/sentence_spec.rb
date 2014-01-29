require 'pry'
require_relative 'spec_helper'
require_relative '../sentence'

describe Sentence do
  before :each do
    @sentence = Sentence.new
    @words = %w(words are here)
    @sentence.words << @words
    @sentence.words.flatten!
  end

  describe '#valid?' do
    it "returns true if the sentence includes every specified word" do
      expect(@sentence).to be_valid(@words)
    end

    it "returns false if the sentence does not include every specified word" do
      #remove one word to simulate the situation
      @sentence.words.pop
      expect(@sentence).to_not be_valid(@words)
    end
  end

  describe '#present' do
    before :each do
      @sentence.present
    end

    it 'capitalized the first word in the sentence' do
      expect(@sentence.words.first).to eq 'Words'
    end

    it 'ends the sentece with a period' do
      expect(@sentence.words.last).to eq '.'
    end
  end

end



