require 'singleton'
require './BadConsequence.rb'
require './Monster.rb'
require './Treasure.rb'
require './TreasureKind.rb'

class CardDealer
  
  include Singleton
  
  def initialize()
    @unusedtreasures = Array.new
    @unusedmonsters = Array.new
    @usedtreasures = Array.new
    @usedmonsters = Array.new
  end
  
  #-----------------------------------------------------------------------------
  private
  def initTreasureCardDeck
      
    #Inicializamos todas las cartas de tesoros
    #Tesoro 1: Si mi amo
    treasure = Treasure.new("!Si mi amo!", 0, 4, 7, [TreasureKind: "HELMET"])
    @unusedtreasures << treasure

    #Tesoro 2: Botas de investigaciÃ³n
    treasure = Treasure.new("Botas de Investigacion", 600, 3, 4, [TreasureKind: "SHOE"])
    @unusedtreasures << treasure

    #Tesoro 3: Capucha de Cthulhu
    treasure = Treasure.new("Capucha de Cthulhu",500, 3, 5, [TreasureKind: "HELMET"])
    @unusedtreasures << treasure

    #Tesoro 4: A prueba de babas
    treasure = Treasure.new("A prueba de babas", 400, 2, 5, [TreasureKind: "ARMOR"])
    @unusedtreasures << treasure

    #Tesoro 5: Botas de lluvia Ã¡cida
    treasure = Treasure.new("Botas de lluvia Acida", 800, 1, 1, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 6: Casco de minero
    treasure = Treasure.new("Casco de minero", 400, 2, 4, [TreasureKind: "HELMET"])
    @unusedtreasures << treasure

    #Tesoro 7: Ametralladora Thompson
    treasure = Treasure.new("Ametralladora Thompson", 600, 4, 8, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 8: Camiseta de la UGR
    treasure = Treasure.new("Camiseta de la UGR", 100, 1, 7, [TreasureKind: "ARMOR"])
    @unusedtreasures << treasure

    #Tesoro 9: Clavo de rail ferroviario
    treasure = Treasure.new("Clavo de rail ferroviario", 400, 3, 6, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 10: Cuchillo de sushi arcano
    treasure = Treasure.new("Cuchillo de sushi arcano", 300, 2, 3, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 11: Fez alÃ³podo
    treasure = Treasure.new(" Fez alopodo", 700, 3, 5, [TreasureKind: "HELMET"])
    @unusedtreasures << treasure

    #Tesoro 11: Hacha prehistÃ³rica
    treasure = Treasure.new("Hacha prehistorica", 500, 2, 5, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 12: El aparato del Pr. Tesla
    treasure = Treasure.new("El aparato del Pr. Tesla", 900, 4, 8, [TreasureKind: "ARMOR"])
    @unusedtreasures << treasure

    #Tesoro 13: Gaita
    treasure = Treasure.new("Gaita", 500, 4, 5, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 14: Insecticida
    reasure = Treasure.new("Insecticida", 300, 2, 3, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 15: Escopeta de tres caÃ±ones
    treasure = Treasure.new("Escopeta AA-12", 700, 4, 6, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 16 : Garabato mÃ­stico
    treasure = Treasure.new("Garabato mistico", 300, 2, 2, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 17 : La fuerza de mister T
    treasure = Treasure.new("La fuerza de mister T",1000, 0, 0, [TreasureKind: "NECKLACE"])
    @unusedtreasures << treasure

    #Tesoro 18 : La rebeca metÃ¡lica
    treasure = Treasure.new("La rebeca metalica",400, 2, 3, [TreasureKind: "ARMOR"])
    @unusedtreasures << treasure

    #Tesoro 19 : NecroplayboycÃ³n
    treasure = Treasure.new("Necroplayboycon",300, 3, 5, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 20 : Lanzallamas
    treasure = Treasure.new("Lanzallamas",800, 4, 8, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 21 : Necro-comicon
    treasure = Treasure.new("Knecro-comicon",100, 1, 1, [TreasureKind: "ONEHANDS"])
    @unusedtreasures << treasure

    #Tesoro 22 : Necronomicon
    treasure = Treasure.new("Knecronomicon",800, 5, 7, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 23 : Linterna a dos manos
    treasure = Treasure.new("Linterna a dos manos",400, 3, 6, [TreasureKind: "BOTHHANDS"])
    @unusedtreasures << treasure

    #Tesoro 24 : NecroGnomicon
    treasure = Treasure.new("NecroGnomicon",200, 2, 4, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 25 : NecrotelecÃ³m
    treasure = Treasure.new("Necrotelecon",300, 2, 3, [TreasureKind: "HELMET"])
    @unusedtreasures << treasure

    #Tesoro 26 : Porra preternatural
    treasure = Treasure.new("Porra preternatural",200, 2, 3, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure

    #Tesoro 27 : TentÃ¡culo de pega
    treasure = Treasure.new("Tentaculo de pega",200, 0, 1, [TreasureKind: "HELMET"])
    @unusedtreasures << treasure

    #Tesoro 28 : Zapato deja-amigos
    treasure = Treasure.new("Zapato deja-amigosa",500, 0, 1, [TreasureKind: "SHOE"])
    @unusedtreasures << treasure

    #Tesoro 29 : Shogulador
    treasure = Treasure.new("Shogulador",600, 1, 1, [TreasureKind: "BOTHHANDS "])
    @unusedtreasures << treasure

    #Tesoro 30 : Varita de atizamiento
    treasure = Treasure.new("Varita de atizamiento",400, 3, 4, [TreasureKind: "ONEHAND"])
    @unusedtreasures << treasure
  end
  #-----------------------------------------------------------------------------
  private
  def initMonsterCardDeck
    #1. 3 Byakhees de bonanza
    badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visibe y otra oculta.',
    0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    price = Prize.new(2,1)
    @unusedmonsters << Monster.new('3 Byakhees de bonanza',8,badConsequence,price)

    #2. Chibithulhu
    badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible.', 0, [TreasureKind: "HELMET" ],nil)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('Chibithulhu', 2, badConsequence, price)

    #3. El sopor de Dunwich
    badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes el calzado visible.', 0, [TreasureKind: "SHOE"], nil)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('El sopor de Dunwich', 2, badConsequence, price)

    #4. Ángeles de la noche ibicenca
    badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.',
    0,[TreasureKind::ONEHAND], [TreasureKind: "ONEHAND"])
    price = Prize.new(4,1)
    @unusedmonsters << Monster.new('Angeles de la noche ibicenca',14, badConsequence, price)

    #5. El gorrón en el umbral
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles.', 0, 10, 10)
    price = Prize.new(3,1)
    @unusedmonsters << Monster.new('El gorron en el umbral', 10, badConsequence, price)

    #6. H.P.Munchcraft
    badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible.', 0, [TreasureKind: "ARMOR"], nil)
    price = Prize.new(3, 1)
    @unusedmonsters << Monster.new('H.P.Munchcraft',6,badConsequence, price)

    #7. Bichgooth
    badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta la armadura visible.',
    0, [TreasureKind: "ARMOR"], nil)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('Bichgooth', 2, badConsequence, price)

    #8. El rey de rosa
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles.', 5, 3, 0)
    price = Prize.new(1,2)
    @unusedmonsters << Monster.new('El rey de rosa', 13, badConsequence, price)

    #9. La que redacta en las tinieblas
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles.', 2, 0, 0)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('La que redacta en las tinieblas', 2, badConsequence, price)

    #Los hondos 10
    badConsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficiales y te aburren mortalmente, estas muerto.')
    price = Prize.new(2,1)
    @unusedmonsters << Monster.new('Los hondos', 8, badConsequence, price)

    #Semillas Cthulhu 11
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos.', 2, 0, 2)
    price = Prize.new(2,1)
    @unusedmonsters << Monster.new('Semillas Cthulhu', 4, badConsequence, price)

    #Dameargo 12
    badConsequence = BadConsequence.newLevelSpecificTreasures('Te intenta saquear, pierdes una mano visible.', 2, nil, [TreasureKind: "ONEHAND"])
    price = Prize.new(2,1)
    @unusedmonsters << Monster.new('Dameargo', 1, badConsequence, price)

    #Pollipolipo Volante 13
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito, pierdes 3 niveles.',
    3,0,0)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('Pollipolipo', 3, badConsequence, price)

    #YskhtihyssgGoth 14
    badConsequence = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre, estas muerto.')
    price = Prize.new(3,1)
    @unusedmonsters << Monster.new('YskhtihyssgGoth', 12, badConsequence, price)

    #Familia feliz 15
    badConsequence = BadConsequence.newDeath('La familia te atrapa estas muerto.')
    price = Prize.new(4,1)
    @unusedmonsters << Monster.new('Familia Feliz', 1, badConsequence, price)

    #Roboggoth 16
    badConsequence = BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de a 2 manos visible.',2,[TreasureKind: "BOTHHAND"],nil)
    price = Prize.new(2,1)
    @unusedmonsters << Monster.new('Roboggoth', 8, badConsequence, price)

    #El espia 17
    badConsequence = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche, pierdes un casco visible.',0,[TreasureKind: "HELMET"],nil)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('El espia', 5, badConsequence, price)

    #El lenguas 18
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.',2,5,0)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('El lenguas', 20, badConsequence, price)

    #Bicefalo 19
    badConsequence = BadConsequence.newLevelNumberOfTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles.',3,0,0)
    price = Prize.new(1,1)
    @unusedmonsters << Monster.new('Bicefalo', 20, badConsequence, price)
  end
  #-----------------------------------------------------------------------------
  private
  def shuffleTreasures
    @unusedtreasures.shuffle!
  end
  #-----------------------------------------------------------------------------
  private 
  def shuffleMonsters
    @unusedmonsters.shuffle!
  end
  #-----------------------------------------------------------------------------
  public
  def nextTreasure
    if(@unusedtreasures.size == 0)
      @unusedtreasures = Array.new(@usedtreasures)
      @usedtreasures.clear
    end
    
    next_treasure = @unusedtreasures.at(0)
    @usedtreasures << next_treasure
    @unusedtreasures.delete(next_treasure)
    return next_treasure
  end
  #-----------------------------------------------------------------------------
  public 
  def nextMonster
    if(@unusedmonsters.size == 0)
       @unusedmonsters = Array.new(@usedmonsters)
       @usedmonsters.clear
    end
    
    next_monster = @unusedmonsters.at(0)
    @usedmonsters << next_monster
    @unusedmonsters.delete(next_monster)
    return next_monster
    
  end
  #-----------------------------------------------------------------------------
  public
  def giveTreasureBack(treasure)
    @usedtreasures << treasure
  end
  #-----------------------------------------------------------------------------
  public 
  def giveMonsterBack(monster)
    @usedmonsters << monster
  end
  #-----------------------------------------------------------------------------
  public 
  def initCards
    
    initMonsterCardDeck
    initTreasureCardDeck
    shuffleMonsters
    shuffleTreasures
  end
  #-----------------------------------------------------------------------------
end
