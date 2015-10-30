# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './Player'
require './Treasure.rb'
require './Monster.rb'
require './Dice.rb'
require './TreasureKind.rb'
require './CombatResult.rb'
require './Cultist.rb'


class CultistPlayer < Player
  
  @@totalCultistPlayers = 0
  
  def initialize(player,cultist)
    @@totalCultistPlayers =@@totalCultistPlayers + 1
    Super(player.name)
    copyPlayer(player)
    @myCultistCard = cultist
  end
  
  attr_accessor :totalCultistPlayers
  
 
  def shouldConvert
    return false
  end
  
 
  def getCombatLevel
    
    level = super
    level = level + @myCultistCard.specialValue
    return level
    
  end

  def getOponentLevel
    return monster.specialValue
  end
  
  def computeGoldCoinsValue
    return super*2
  end
  
  def getTotalCultistPlayers
    return @@totalCultistPlayers
  end
end
