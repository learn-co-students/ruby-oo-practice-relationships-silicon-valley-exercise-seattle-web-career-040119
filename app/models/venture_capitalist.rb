class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []
  
  def initialize (name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(type, investment, startup, self)
  end

  def funding_rounds
    FundingRound.all.select do |fr|
      fr.venture_capitalist == self
    end
  end

  def portfolio
    x=FundingRound.all.select do |fr|
      fr.venture_capitalist == self
    end.uniq
    x.map do |iterator|
      iterator.startup
    end.uniq
  end

  def biggest_investment
    x=FundingRound.all.select do |fr|
      fr.venture_capitalist == self
    end.uniq
    x.max_by do |iterator|
      iterator.investment
    end
  end

  def invested(domain)
    x=FundingRound.all.select do |fr|
      fr.venture_capitalist == self
    end.uniq
    x.map do |iterator|
      iterator.investment
    end.sum
  end

end
