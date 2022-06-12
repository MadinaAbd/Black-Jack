#require_relative 'cards'
require_relative 'player'

class User < Player
  include Bank

  def initialize(*name)
    super
    @name = name
  end

  def show_cards
      @cards.each { |card| puts card }
  end

end
