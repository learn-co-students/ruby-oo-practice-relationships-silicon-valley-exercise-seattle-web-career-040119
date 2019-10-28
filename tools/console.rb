require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Awesome Inc.", "Aaron", "Actuary")
s2 = Startup.new("Bro Corp", "Brad", "Billing")
s3 = Startup.new("Cool Corp", "Claire", "Chemistry")

vc1 = VentureCapitalist.new("Xavier", 2000000000)
vc2 = VentureCapitalist.new("Yvette", 2000000000)
vc3 = VentureCapitalist.new("Zack", 1000)

fr1 = FundingRound.new("angel", 1000, s1, vc1)
fr2 = FundingRound.new("pre-seed", 2000, s2, vc2)
fr3 = FundingRound.new("seed", 3000, s3, vc3)

Pry.start
puts "done" #leave this here to ensure binding.pry isn't the last line