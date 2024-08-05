require "json"
require "open-uri"

class GamesController < ApplicationController
  def home
    @array_letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    @word = params[:word]
    @bool_included = included?
    @bool_englishword = englishword?
  end

  private

  def included?
    boolean = @words.to_s.chars.all? { |letter| @array_letters.include?(letter)}
    return boolean
  end

  def englishword?
    url = "https://dictionary.lewagon.com/#{@word}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    return user["found"]
  end

end
