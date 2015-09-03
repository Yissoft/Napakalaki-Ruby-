# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './CombatResult.rb'
require './Monster.rb'
require './Player.rb'
require './CardDealer.rb'
require 'singleton'

class Napakalaki
  
  include Singleton
 
  attr_accessor :currentMonster,:players,:currentPlayer
  
  #-----------------------------------------------------------------------------
  private
  def initPlayers(names)
    names.each do |name|
      @players = Array.new
      #Los jugadores se inicializan con nivel 1, sin tesoros ni badconsequence
      player = Player.new(name,1,true)
      @players << player
    end
  end
  #-----------------------------------------------------------------------------
  public 
  def debugInitPlayers
    @players.each do |p|
      puts p.name
    end
  end
  #-----------------------------------------------------------------------------
  private
  def nextPlayer
    #Caso 1: aleatorio entre los 3 jugadores
    if(@currentPlayer == nil) #No hay jugador actual, primera vez q se juega  
      tam = @players.size
      pos = rand(tam)
      @currentPlayer = @players.at(pos)
    else
      i = @players.index(@currentPlayer)
      pos = (i+1)%3
      @currentPlayer = @players.at(pos)
    end
  end
  #-----------------------------------------------------------------------------
  private
  def nextTurnAllowed
    if(@currentPlayer.validState)
      return true
    else 
      return false
    end
  end
  #-----------------------------------------------------------------------------
  public 
  def developCombat
    dealer = CardDealer.instance
    combatResult = @currentPlayer.combat(@currentMonster)
    dealer.giveMonsterBack(@currentMonster)
    return combatResult
  end
  #-----------------------------------------------------------------------------
  public 
  def discardVisibleTreasure(treasures)
    
    dealer = CardDealer.instance
    treasures.each do |t|
      @currentPlayer.discardVisibleTreasure(t)
      dealer.giveTreasureBack(t)
    end
  end
  #-----------------------------------------------------------------------------
  public 
  def discardHiddenTreasures(treasures)
    treasures.each do |t|
      @currentPlayer.discardHiddenTreasure(t)
      @dealer.giveTreasureBack(t)
    end
  end
  #-----------------------------------------------------------------------------
  public 
  def makeTreasuresVisible(treasures)
    treasures.each do |t|
      @currentPlayer.makeTreasureVisible(t)
    end
  end
  #-----------------------------------------------------------------------------  
  public 
  def buyLevels(visibleT, hiddenT)
    return @currentPlayer.buyLevels(visibleT, hiddenT)
  end
  #-----------------------------------------------------------------------------
  public 
  def initGame(players)
    dealer = CardDealer.instance
    dealer.initCards
    initPlayers(players)
    nextTurn
  end
  #-----------------------------------------------------------------------------
  public
  def getCurrentPlayer
    return @currentPlayer
  end
  #----------------------------------------------------------------------------
  public
  def getCurrentMonster
    return @currentMonster
  end
  #----------------------------------------------------------------------------
  public
  def nextTurn
    dealer = CardDealer.instance
    
    stateOk = false
    if(@currentPlayer == nil)
      stateOk = true
    elsif(@currentPlayer != nil)
      stateOk = nextTurnAllowed
    end
    
    if(stateOk)
      @currentMonster = dealer.nextMonster
      @currentPlayer = nextPlayer
      if(@currentPlayer.isDead)
        @currentPlayer.initTreasures
      end
    end
    return stateOk
  end
  #-----------------------------------------------------------------------------
  public
  def endOfGame(combatResult)
     if(combatResult == [CombatResult: "WinAndWinGame"])
      return true
    else 
      return false
    end
  end
  #-----------------------------------------------------------------------------
  
end
