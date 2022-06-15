module Bank

  attr_reader :bank, :game_bank
  BET = 10

  def initialize
    @bank = 100
    @game_bank = 0
    bankrout

  end

  def bet
    @bank =- BET
    @game_bank =+ 10
  end

  def bankrout
    raise "В банке - 0! Вы банкрот. " if @bank.zero?
  end


end



