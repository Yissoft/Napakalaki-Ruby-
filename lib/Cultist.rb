# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './CultistPlayer.rb'
require './Card.rb'

class Cultist < Card
  def initialize(gainedlevels)
    @name = "Sectario"
    @gainedLevels = gainedlevels
  end
  
  attr_accessor :name, :gainedLevels
  
  public 
  def basicValue
    return @gainedLevels
  end
  
  public 
  def specialValue
    return @gainedLevels * CultistPlayer.totalCultistPlayers
  end
  
end
