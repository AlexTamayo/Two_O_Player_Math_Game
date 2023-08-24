class Player
  @@player_number = 0
  attr_accessor :score, :lives, :dead
  attr_reader :name, :abv

  def initialize()
    @@player_number += 1
    @name = "Player #{@@player_number}"
    @abv = "P#{@@player_number}"
    @score = 0
    @lives = 3
  end
  
  def score_add(add)
    self.score += add.to_i
  end

  def life_subtract
    self.lives -= 1 if self.lives > 0
  end

  def dead?
    self.lives <= 0
  end

  def padded_score
    self.score.to_s.rjust(2, '0')
  end

  private

  def to_s
    @name
  end
end


if __FILE__ == $0
  
  puts ""
  
  p1 = Player.new
  p1.score_add(5)
  p1.score_add(8)
  
  p1.life_subtract
  p1.life_subtract
  p1.life_subtract
  p1.life_subtract
  
  puts "#{p1.abv}: #{p1.padded_score}pts (lives: #{p1.lives}/3) | Dead? #{p1.dead?}"
  
  
  p2 = Player.new
  
  puts "#{p2.abv}: #{p2.padded_score}pts (lives: #{p2.lives}/3) | Dead? #{p2.dead?}"

end