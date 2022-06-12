#require_relative 'cards'
require_relative 'player'

class Dealer < Player
  include Bank
  attr_reader :name

  def initialize
    super
    @name = "Dealer"
  end

  def show_cards
   puts "*"
  end

 def choise
    case @points
    when @points >= 17
      puts "Пропустить ход"

    when @points < 17
       puts "Xод"
      deal_cards
    end
  end


end
