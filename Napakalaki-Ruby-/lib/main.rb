# encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './Napakalaki.rb'
require './game_tester.rb'

module Test

  class EjemploMain
   
      def prueba
    
        test = GameTester.instance
     
        game = Napakalaki.instance
   
        #Se prueba el juego con 2 jugadores o más
        nj = 0
        loop do
          puts "Introduce un numero de jugadores (2 o mas):"
          nj = gets.chomp.to_i
          break if nj >= 2
        end
        test.play(game, nj);
       
      end
      
  end
  
    e = EjemploMain.new
    e.prueba()

end


