require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
  @alphabet = ('a'..'z').to_a
  @timestart = Time.now
  @letters = []
    for i in 0..9 do
      @letters << @alphabet.shuffle[0]
    end
  end

  def score
    @letters = params[:letters].split(//)
    @guess = params[:guess]
    @word = @guess.downcase.split(//)

    @time = params[:time].to_i

    @result = open("https://wagon-dictionary.herokuapp.com/#{@guess}").read
    @answer = JSON.parse(@result)
  end
end
