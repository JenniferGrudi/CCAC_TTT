require "minitest/autorun"
require_relative "unbeatable.rb"

class TestUnbeatable < Minitest::Test

	def test_for_creating_player
		player = Unbeatable.new("X")
		assert_equal("X", player.marker)
	end

	def test_choices_a_move
		player = Unbeatable.new("X")
		move = player.get_move([" "," "," "," "," "," "," "," "," "])
		assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
	end

	def test_X_takes_winning_space_5
		player = Unbeatable.new("X")
		assert_equal(5, player.possible_wins([" "," "," ","X","X"," ","O"," ","O"]))
	end	

	def test_O_takes_winning_space_7
		player = Unbeatable.new("O")
		assert_equal(7, player.possible_wins([" ","X"," ","X"," "," ","O"," ","O"]))
	end	

	def test_X_blocks_space_7
		player = Unbeatable.new("X")
		assert_equal(7, player.possible_blocks([" ","X"," ","X"," "," ","O"," ","O"]))
	end	

	def test_O_blocks_space_5
		player = Unbeatable.new("O")
		assert_equal(5, player.possible_blocks([" "," "," ","X","X"," ","O"," ","O"]))
	end	


end