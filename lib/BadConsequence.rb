# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require './TreasureKind.rb'

class BadConsequence
  def initialize(aText, levels, nVisibleTreasures, nHiddenTreasures,specificVisibleTreasures, specificHiddenTreasures, death)
    @text = aText
    @levels = levels
    @nVisibleTreasures = nVisibleTreasures
    @nHiddenTreasures = nHiddenTreasures
    @specificVisibleTreasures = specificVisibleTreasures
    @specificHiddenTreasures = specificHiddenTreasures
    @death = death
  end
  #-----------------------------------------------------------------------------
  #Consultores
  attr_accessor :text,:levels,:nVisibleTreasures,:HiddenTreasures,
    :specificVisibleTreasures,:specificHiddenTreasures,:death
  #-----------------------------------------------------------------------------
  public 
  def getVT
    @nVisibleTreasures
  end
  #-----------------------------------------------------------------------------
  public 
  def getHT
    @nHiddenTreasures
  end
  #-----------------------------------------------------------------------------
  public 
  def getSVT
    @specificVisibleTreasures
  end
  #-----------------------------------------------------------------------------
  public 
  def getVT
    @specificVisibleTreasures
  end
  #-----------------------------------------------------------------------------
  public 
  def getDeath
    @death
  end
  #-----------------------------------------------------------------------------
  #Constructores que utilizan initialize
  def self.newLevelNumberOfTreasures(text,levels, nVisibleTreasures, nHiddenTreasures)
    new(text,levels,nVisibleTreasures,nHiddenTreasures,Array.new,Array.new,false)
  end
  
  def self.newLevelSpecificTreasures(text, level, specificVisibleTreasures, specificHiddenTreasures)
    new(text,level,0,0,specificVisibleTreasures,specificHiddenTreasures,false)
  end
  
  def self.newDeath(aText)
    new(aText,0,0,0,Array.new,Array.new,true)
  end
  #-----------------------------------------------------------------------------
  private_class_method :new #Asi evitamos que se pueda utilizar new y utilicemos
  #como consecuencia los constructores que hemos creado.
  #-----------------------------------------------------------------------------
  def to_s
    puts "BadConsequence:"
    puts "  Descripcion: #{@text}."
    if(@levels != nil)
      puts "  Niveles: #{@levels}."
    end
    
    if(@nVisibleTreasures != nil)
      puts "  Tesoros visibles: #{@nVisibleTreasures}"
      puts "  Tesoros ocultos: #{@nHiddenTreasures}"
    end
    
    if(@specificHiddenTreasures != nil)
      puts "  Tesoros visibles especificos: #{@specificVisibleTreasures}"
      puts "  Tesoros ocultos especificos: #{@specificHiddenTreasures}"
    end
    
    if(@death)
      puts "  Este monstruo te mata."
    end
  end
  #-----------------------------------------------------------------------------
  public
  def isEmpty
=begin
  Método que establece los valores para los que el BadConsequence es nulo o 
  el player no tiene ningun BC que cumplir

  - No pierde niveles 
  - No tiene visibles ni ocultos que descartar (varios ni específicos)
  - No tiene que morir
=end
    if(@levels == 0 and @nVisibleTreasures == 0 and 
          @nHiddenTreasures == 0 and @specificVisibleTreasures.empty? and 
          @specificHiddenTreasures.empty? and !death)
      return true
    else false
    end
  end
  #-----------------------------------------------------------------------------
  public 
  def substractVisibleTreasure(treasure)
    if(@nVisibleTreasures == 0)#Si no tiene especificos
      tipo = treasure.type
      if(@specificVisibleTreasures.include?(tipo))
        indice = @specificVisibleTreasures.index(tipo)
        @specificVisibleTreasures.delete_at(indice)
        
      else 
        if(@nVisibleTreasures-1 >= 0)
          @nVisibleTreasures - 1
        end
      end
    end   
  end
  #-----------------------------------------------------------------------------
  public
  def substractHiddenTreasure(treasure)
    if(@nHiddenTreasures == 0)#Si no tiene especificos
      tipo = treasure.type
      if(@specificHiddenTreasures.include?(tipo))
        indice = @specificHiddenTreasures.index(tipo)
        @specificHiddenTreasures.delete_at(indice)
        
      else 
        if(@nHiddenTreasures-1 >= 0)
          @nHiddenTreasures - 1
        end
      end
    end   
  end
  #-----------------------------------------------------------------------------
  public 
  def adjustToFitTreasureList(visible, hidden)
    
    if(@nVisibleTreasures == 0 and @nHiddenTreasures == 0)
      tV = Array.new #Tesoros Visibles
      tH = Array.new #Tesoros Ocultos
      
      #ESPECIFICOS
      visible.each do |v|
        if(@specificVisibleTreasures.include?(v.type))
          tV << v.type
        end
      end
      
      hidden.each do |h|
        if(@specificHiddenTreasures.include?(h.type))
          tH << h.type
        end
      end
      
      bc = BadConsequence.newLevelSpecificTreasures(@text,0,tV,tH)
      
    else 
      visiblesize = visible.length
      hiddensize = hidden.length
      
      if(@nVisibleTreasures >= visiblesize)
        nV = visiblesize
      else
        nV = @nVisibleTreasures
      end
      
      if(@nHiddenTreasures >= hiddensize)
        nH = hiddensize
      else
        nH = @nHiddenTreasures
      end
      
      bc = BandConsequence.newLevelNumberOfTreasures(@text,0,nV,nH)
      
    end
    
    return bc
    
  end
  #-----------------------------------------------------------------------------
  public
  def myBadConsequenceIsDeath
    if(@death)
      return true
    else
      return false
    end
  end
  
  #-----------------------------------------------------------------------------
  public 
  def onlyLevelBC
    return (@nHiddenTreasures == nil and @nVisibleTreasures == nil and
      @death == nil and @specificVisibleTreasures == nil and @specificHiddenTreasures == nil)
  end
end
