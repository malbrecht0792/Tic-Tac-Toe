# Things we need

# Board which has 9 spaces
# Players (2)
# Logic for declaring a winner
# While loop until winner
# Logic for if a space has been taken already
# Logic for if there is no winner
# Turns

class Game

	def initialize(player1_name, player2_name)
		@player1 = Player.new(player1_name, "X")
		@player2 = Player.new(player2_name, "O")
		@current_player = @player1
		@board = Board.new
		@continue_game = true
		game_loop
	end

	def game_loop
		while @continue_game
			turn(@current_player)
		end
	end

	def turn(current_player)
		puts "#{@current_player.name}, please select a space."
		@space_to_move = gets.chomp.to_i
		check_space_to_move
		@board.update_board(@current_player, @space_to_move)
		@board.display_board
		#Call check_for_winner
		declare_winner if check_for_winner 
		#Call check for no winner
		check_for_no_winner
		#Change players
		change_players
	end

	def check_space_to_move
		if @board.spaces[@space_to_move-1] != "-"
			puts "Space already taken! Please select a different space."
			@space_to_move = gets.chomp.to_i
			check_space_to_move
		end
	end

	def change_players
		if @current_player == @player1
			@current_player = @player2
		elsif @current_player == @player2
			@current_player = @player1
		end
	end

	def check_for_winner
		
		all_winning_spaces_array = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		all_winning_spaces_array.each do |winning_spaces_array|
			all_spaces_true = true
			winning_spaces_array.each do |winning_index|
				all_spaces_true = false unless @board.spaces[winning_index] == @current_player.symbol
			end
			if all_spaces_true
				return true
			end
		end

		return false
	end

	def declare_winner
		puts "#{@current_player.name}, you are the winner!"
		@continue_game = false
	end

	def check_for_no_winner
		puts 
		if @board.spaces.none? { |space| space == "-" }
			puts "There is no winner!"
			@continue_game = false
		end
	end

end

class Player
	attr_accessor :name, :symbol

	def initialize(name, symbol)
		@name = name
		@symbol = symbol
	end
end

class Board
	attr_accessor :spaces, :space_to_move

	def initialize
		@spaces = ["-","-","-","-","-","-","-","-","-"]
		display_board
	end

	def display_board
		print "\n"
		@spaces.each_with_index do |space, index|
			if [2,5].include? index 
				print @spaces[index] + "\n"
			else
				print @spaces[index] + " "
			end
		end
		print "\n\n"
	end

	def update_board(current_player, space_to_move)
		@spaces[space_to_move-1] = current_player.symbol
	end
end

my_game = Game.new("Marcel", "Ben")


