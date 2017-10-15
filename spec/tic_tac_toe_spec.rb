require "tic_tac_toe"


describe Player do

	let (:my_player) do
		Player.new("Marcel", "X")
	end

	describe "initialize" do
		context "given a new instance of class Player, Player.name" do
			it "returns the player's name" do
				expect(my_player.name).to eql("Marcel")
			end
		end

		context "given a new instance of class Player, Player.symbol" do
			it "returns the player's symbol" do
				expect(my_player.symbol).to eql("X")
			end
		end
	end

end

describe Game do

	let (:my_game) do
		Game.new("Marcel", "Ben")
	end

	#let (@board.spaces) do
	#	["X","X","X","-","-","-","-","-","-"]
	#end

	describe "check_for_winner" do
		context "given a player's symbol and a winning board status" do 
			it "returns true" do
				expect(my_game.check_for_winner).to be true
			end
		end
	end

end