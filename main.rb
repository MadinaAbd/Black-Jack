require_relative 'user'
require_relative 'dealer'
#require_relative 'cards'
require_relative 'bank'

class Game
  attr_accessor :user, :dealer, :cards, :bank

MENU = [
    { index: 1, title: 'Пропустить', action: :user_pass },
    { index: 2, title: 'Добавить карту', action: :user_take_card },
    { index: 3, title: 'Открыть карты', action: :open_cards }
  ].freeze

   ROUND = [
    { index: 1, title: 'Новый раунд?', action: :new_round },
    { index: 2, title: 'Выход', action: :quit }
  ].freeze

  def initialize
    @user = User.new
    @dealer = Dealer.new
    #@cards = Cards.new
    @bet_bank = 0
    start
  end

  def start
    puts "Как тебя зовут?"
    name = gets.chomp.to_s
    @user = User.new(name)

    puts "Начнём игру #{name}"
    round
    new_round
  end

  def round
    2.times {user.deal_cards}
    2.times {dealer.deal_cards}
    puts "Твои карты: #{user.show_cards}"
    puts "Карты соперника: * "
    user.bet
    dealer.bet
    puts "Твои очки: #{user.points}"
    user_choise

  end

  def user_choise
    puts "Твой ход, #{user.name}"
    MENU.each { |item| puts "#{item [:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = MENU.find { |item| item[:index] == choice }
    send(need_item[:action])

  end

  def user_pass
    dealer.choise
    puts "Соперник сделал свой ход"
    user_choise
  end

  def user_take_card
    if user.counter == true
      open_cards
    else
      user.deal_cards
      puts "Твои карты: #{user.show_cards}"
      puts "Твои очки: #{user.points}"
    end
  end

  def open_cards
    puts "Твои карты: #{user.cards}"
    puts "Твои очки: #{user.points}"
    puts "Карты соперника: #{dealer.cards}"
    puts "Очки соперника: #{dealer.points}"
    winner
  end

  def winner

    if @user.points == @dealer.points
      puts "Ничья"
      user.bank += 10
      dealer.bank += 10

    elsif @user.points > 21
     puts "Вы проиграли1"
     dealer.bank += 20

    elsif
      (21 - user.points) > (21 - dealer.points)
      puts "Вы проиграли2"
      dealer.bank += 20
    else
      puts "Вы выиграли!"
      user.bank += 10
    end
  end


  def new_round
    puts "Твой ход, #{user.name}"
    ROUND.each { |item| puts "#{item[:index]}: #{item[:title]}" }
    choice = gets.chomp.to_i
    need_item = ROUND.find { |item| item[:index] == choice }
    send(need_item[:action])
  end


  def quit
    puts 'Игра закончена!'
    exit(0)
  end

end
Game.new

