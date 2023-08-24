class GameLogic
  attr_accessor :number_of_players, :players, :current_player_index, :current_player, :winner
  attr_reader :lives

  PRESS_ENTER = "Press Enter for default"
  NUMBER_OF_LIVES = 3
  HIGH_SCORE = 5

  def initialize
    @number_of_players = nil
    @players = []
    @math_p = MathProblem.new
    @current_player_index = 0
    @current_player = nil
    @winner = nil
    @lives = NUMBER_OF_LIVES
    number_of_players_prompt
  end

  # NUMBER OF PLAYERS PROMPT
  def number_of_players_prompt
    system("clear")
    puts "\nHow many players are you? (#{PRESS_ENTER} 2)"
    print "> "
    @number_of_players = gets.chomp

    if @number_of_players.empty?
      @number_of_players = 2
    end

    player_creation
  end

  # PLAYER CREATION
  def player_creation
    player_name = []

    @number_of_players.to_i.times do |i|
      puts "\nWhat is Player #{i + 1}'s name? (#{PRESS_ENTER})"
      print "> "
      player_name << gets.chomp
    end

    @number_of_players.to_i.times do |i|
      players << Player.new(player_name[i], @lives)
    end

    system("clear")
    score_display
    math_problem_generator
  end
  
  # CURRENT PLAYER
  def current_player
    @current_player = players[current_player_index]
  end

  def math_problem_generator
    puts  "\n#{current_player.name}: #{@math_p.operation_logic}"
    print "> "
    input = gets.chomp
    check_answer(input)
  end
  
  # CHECK ANSWER
  def check_answer(answer)
    if answer.empty?
      wrong_answer
    elsif answer.to_i == @math_p.solution
      correct_answer
    else
      wrong_answer
    end
  end

  # CORRECT ANSWER
  def correct_answer

    puts "\n#{current_player.name}: YES! You are correct."
    current_player.score += 1

    if current_player.score == HIGH_SCORE
      @winner = current_player
      system("clear")
      score_display
      game_over
    else
      next_turn
    end
  end

  # WRONG ANSWER
  def wrong_answer

    puts "\n#{current_player.name}: Seriously? No!"
    current_player.life_subtract

    if current_player.dead?
      sleep(1)
      puts "\n\n#{current_player.name} has been eliminated!"
      eliminate_player(current_player)
    else
      next_turn
    end

  end
  
  # NEXT TURN
  def next_turn
    sleep(1)
    system("clear")
    score_display
    puts "\n----- NEW TURN -----"
    @current_player_index = (current_player_index + 1) % players.size
    math_problem_generator
  end

  # SCORE DISPLAY
  def score_display
    puts ""
    @players.size.times do |i|
      puts "#{players[i].abv}: #{players[i].padded_score} pts | lives: #{players[i].lives}/#{@lives} | #{players[i].name}"
    end
  end

  # CHECKS IF THERE'S FEWER THAN TWO PLAYERS
  def fewer_than_two_player?
    players.size < 2
  end

  # ELIMINATES PLAYER
  def eliminate_player(player)
    sleep(2.5)
    players.delete(player)

    if fewer_than_two_player?
      @winner = players[0]
      system("clear")
      game_over
    else
      @current_player_index = (current_player_index - 1) % players.size
      next_turn
    end
  end

  # GAME OVER
  def game_over
    puts "\n#{@winner.name} wins with a score of #{@winner.score} pts and #{@winner.lives}/#{@lives} lives!"
    puts "\n----- GAME OVER -----"
    puts "\nGood bye!"
  end

end