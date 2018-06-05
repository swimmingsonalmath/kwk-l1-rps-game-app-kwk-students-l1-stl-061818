class RPSGame
  attr_accessor :play, :computer_play

  Plays = ["rock", "paper", "scissors"]
  
  WinMap = {
    "rock" => "scissors",
    "paper" => "rock",
    "scissors" => "paper"
  }

  def initialize(play)
    if RPSGame.valid_play?(play)
      self.play = play
      self.computer_play = Plays.sample
    else
      raise PlayTypeError
    end
  end

  def self.valid_play?(play)
    play = play if play
    Plays.include?(play)
  end

  def won?
    WinMap[play] == computer_play
  end

  def tied?
    play == computer_play
  end

  def lost?
    !won? && !tied?
  end

  class PlayTypeError < Exception
  end
end
