require_relative 'bank'
#require_relative 'cards'

NUMBER = [*(2..10),'J','K','A','Q']
SUIT = ['clubs','diamonds','hearts','spades']

class Player
  include Bank
  attr_accessor :bank, :cards, :name, :points, :number, :suit
  attr_reader :card_deck


  def initialize(*args)
    @name = name
    @cards = []
    @points = 0
  end


  def deal_cards
    @number = NUMBER.sample
    @suit = SUIT.sample
    user = "#{@number} #{@suit}".to_s
    @cards << user
    count_points
  end

  def counter
     @cards.size == 3
  end

  def count_points
    case @number.to_s
    when '2', '3', '4', '5', '6', '7', '8', '9', '10'
      @points += @number.to_i
    when 'K', 'A', 'Q'
      @points += 10
    when 'J'
      if @points >= 11
         @points += 1
      elsif
      @points <= 10
      @points += 11
      end
    end
  end

end
