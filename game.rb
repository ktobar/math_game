require './player'

class Game
  attr_accessor :player1, :player2

  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
  end

  def question(player)
    val1 = rand(1..20)
    val2 = rand(1..20)
    answer = val1 + val2
    
    puts "#{player.name}: What does #{val1} plus #{val2} equal?"
    input = gets.chomp.to_i
    
    if input != answer
      puts "#{player.name}: Seriously? No!"
      player.score -= 1
    else
      puts "#{player.name}: YES! You are correct."
    end
  end

  def score
    puts "P1: #{player1.score}/3 vs P2: #{player2.score}/3"
  end

  def start
    players = [player1, player2]
    game_done = false
    loser = ''

    while !game_done do
      players.each {|player| 
        if loser != ''
          puts "#{player.name} wins with a score of #{player.score}/3"
          puts "---GAME OVER---"
          game_done = true
          break
        else 
          question(player)
          score
          if player.score == 0
            loser = player
          else 
            puts "---NEW TURN---"
          end
        end
      }
    end
    puts "Good bye!"
  end
end 