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
   if @points >= 17
      puts "Соперник пропустил ход"

    else @points < 17
      puts "Соперник сделал ход"
      deal_cards
    end
  end


end
