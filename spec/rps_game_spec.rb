require 'spec_helper'

describe RPSGame do
  describe "#new" do
    it "should accept valid play types" do
      expect { RPSGame.new("rock")     }.to_not raise_error
      expect { RPSGame.new("paper")    }.to_not raise_error
      expect { RPSGame.new("scissors") }.to_not raise_error
    end

    it "should raise an error for invalid types" do
      expect { RPSGame.new("dynamite") }.to raise_error(RPSGame::PlayTypeError), "Use the line 'raise PlayTypeError' if initialize receives something that is not 'rock', 'paper', or 'scissors'"
    end
  end

  describe "#valid_play?" do
    it "should return true for the string 'paper'" do
      expect(RPSGame.valid_play?("paper")).to eq(true), "The method 'valid_play?' should take in an argument and check if the argument is one of the valid moves, 'rock', 'paper', or 'scissors'"
    end

    it "should return true for the string 'rock'" do
      expect(RPSGame.valid_play?("rock")).to eq(true), "The method 'valid_play?' should take in an argument and check if the argument is one of the valid moves, 'rock', 'paper', or 'scissors'"
    end

    it "should return true for the string 'scissors'" do
      expect(RPSGame.valid_play?("scissors")).to eq(true), "The method 'valid_play?' should take in an argument and check if the argument is one of the valid moves, 'rock', 'paper', or 'scissors'"
    end

    it "should return false for other values" do
      expect(RPSGame.valid_play?("dynamite")).to eq(false), "The method 'valid_play?' should take in an argument and check if the argument is one of the valid moves, 'rock', 'paper', or 'scissors'"
    end
  end

  describe "#computer_play" do
    let(:choices) { ["scissors", "rock", "paper"] }
    it "should return the computer's play" do
      game = RPSGame.new("rock")
      expect(choices).to include(game.computer_play), "When called, .computer_play should return a valid move as a string"
    end
  end

  describe "#won?" do
    it "should return true if the player won" do
      game = RPSGame.new("rock")
      game.instance_variable_set(:@computer_play, "scissors")
      expect(game.won?).to eq(true), "The .won? method needs to check the conditions for losing and ties.  Try using an if..elsif..else statement.  If the game isn't lost or tied, the player has won!"
    end

    it "should return false if the player lost" do
      game = RPSGame.new("rock")
      game.instance_variable_set(:@computer_play, "paper")
      expect(game.won?).to eq(false), "The .won? method needs to check the conditions for losing and ties.  Try using an if..elsif..else statement.  If the game isn't lost or tied, the player has won!"
    end

    it "should return false if the player tied" do
      game = RPSGame.new("rock")
      game.instance_variable_set(:@computer_play, "rock")
      expect(game.won?).to eq(false), "The .won? method needs to check the conditions for losing and ties.  Try using an if..elsif..else statement.  If the game isn't lost or tied, the player has won!"
    end
  end

  describe "#tied?" do
    it "should return true if the player tied" do
      game = RPSGame.new("rock")
      game.instance_variable_set(:@computer_play, "rock")
      expect(game.tied?).to eq(true), "The .tied? method needs to check if the player and computer made the same move.  A conditional with a comparison would work!"
    end

    it "should return false if the player won" do
      game = RPSGame.new("rock")
      game.instance_variable_set(:@computer_play, "scissors")
      expect(game.tied?).to eq(false), "The .tied? method needs to check if the player and computer made the same move.  A conditional with a comparison would work!"
    end

    it "should return false if the player lost" do
      game = RPSGame.new("rock")
      game.instance_variable_set(:@computer_play, "paper")
      expect(game.tied?).to eq(false), "The .tied? method needs to check if the player and computer made the same move.  A conditional with a comparison would work!"
    end
  end

  describe "#lost?" do
    it "should return true if the player lost" do
      game = RPSGame.new('rock')
      game.instance_variable_set(:@computer_play, 'paper')
      expect(game.lost?).to eq(true), "The .lost? method needs to check if the computer's move beats the player's move.  A conditional with multiple arguments or nested conditionals will work."
    end

    it "should return false if the player won" do
      game = RPSGame.new('rock')
      game.instance_variable_set(:@computer_play, 'scissors')
      expect(game.lost?).to eq(false), "The .lost? method needs to check if the computer's move beats the player's move.  A conditional with multiple arguments or nested conditionals will work."
    end

    it "should return false if the player tied" do
      game = RPSGame.new('rock')
      game.instance_variable_set(:@computer_play, 'rock')
      expect(game.lost?).to eq(false), "The .lost? method needs to check if the computer's move beats the player's move.  A conditional with multiple arguments or nested conditionals will work."
    end
  end
end
