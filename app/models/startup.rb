require "pry"

class Startup


  attr_accessor :name, :founder, :domain
  # attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
    self
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(type, investment, self, venture_capitalist)
  end

  def num_funding_rounds
    FundingRound.all.select do |fr|
      fr.startup == self
    end.size
  end
  
  def total_funds
   startup_fr = FundingRound.all.select do |fr|
    fr.startup == self
   end
   startup_fr.map do |sfr|
    sfr.investment
   end.sum
  end

  def investors
    startup_fr = FundingRound.all.select do |fr|
      fr.startup == self
     end
     startup_fr.map do |sfr|
      sfr.venture_capitalist
     end.uniq
  end

  def big_investors
    binding.pry
    VentureCapitalist.tres_commas_club & investors
  end


end


#  A Startup has many VentureCapitalist through FundingRound.