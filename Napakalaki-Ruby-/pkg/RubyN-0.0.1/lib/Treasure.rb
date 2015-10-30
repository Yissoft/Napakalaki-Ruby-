# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './Card.rb'
require './TreasureKind.rb'


class Treasure < Card
  def initialize(name,goldCoins,minBonus,maxBonus, type)
    @name = name
    @goldCoins = goldCoins
    @minBonus = minBonus
    @maxBonus = maxBonus
    @type = type
  end
  
  attr_accessor :name,:goldCoins,:minBonus,:maxBonus,:type
  
  def basicValue
    return @minBonus
  end
  
  def specialValue
    return @maxBonus
  end
  
  
  public
  def to_s 
    puts "Treasure: #{@name}"
    puts "  Monedas de oro: #{@goldCoins}."
    puts "  Min/Max Bonus: #{@minBonus}/#{@maxBonus}."
    puts "  Tipo: #{@type}."
    
    puts"_________________________________________"
  end
  
end
