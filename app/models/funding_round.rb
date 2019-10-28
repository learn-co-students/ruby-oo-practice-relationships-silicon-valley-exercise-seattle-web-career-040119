class FundingRound

  attr_accessor :type, :investment
  attr_reader :startup, :venture_capitalist

  @@all = []

  def initialize(type, investment, startup, venture_capitalist)
    @type = type
    @investment = investment.to_f
    @startup = startup
    @venture_capitalist = venture_capitalist
    @@all << self
  end

  def self.all
    @@all
  end

end
 