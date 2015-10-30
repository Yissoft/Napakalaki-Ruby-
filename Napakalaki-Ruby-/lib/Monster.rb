# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require './BadConsequence.rb'
require './Prize.rb'
require './Card.rb'

class Monster < Card
  
  def initialize(name, combatLevel,badconsequence,price,lcacp)
    @name = name
    @combatLevel = combatLevel
    @price = price
    @badconsequence = badconsequence
    @levelChangeAgaintsCultistPlayer = lcacp
  end
  
  attr_accessor :name,:combatLevel,:price,:badconsequence
  
  def to_s
    puts "Monstruo: "
    puts "  Nombre: #{@name}."
    puts "  Nivel de combate: #{@combatLevel}"
    @price.to_s
    @badconsequence.to_s
    puts "**************************************"
  end
  
  public 
  def onlyLevelBC
    return (@badconsequence.getDeath == nil and @badconsequence.getHT == nil and @badconsequence.getVT == nil and @badconsequence.getSVT == nil and @badconsequence.getSHT == nil)
  end
  
  #getName y getCombatLevel con attr_accesor
  public 
  def getName
    return @name
  end
  
  public 
  def getcombatLevel
    return self.combatLevel
  end
  
  public 
  def getBadConsequence
    return self.badconsequence
  end
  
  public 
  def getLevelsGained
    return self.price.level
  end

  public 
  def getTreasuresGained
    return self.price.treasures
  end
  
  public
  def kills 
    return self.badconsequence.death
  end
  
  #METODOS DE CULTISTS
  public
  def basicValue
    return getcombatLevel
  end
    
  public
  def specialValue
    return getcombatGained + @levelChangeAgaintsCultistPlayer
  end
  
end
