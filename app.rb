require 'sinatra'
require_relative 'sequentialAI.rb'
require_relative 'randomAI.rb'
require_relative 'console_game.rb'
require_relative 'human.rb'

enable :sessions
set :session_secret, 'This is a secret key'

get '/wiki_rules' do
	@title = 'Wiki'
	erb :wiki_rules
end

get '/how_to' do
	@title = 'How To Play'
	erb :how_to
end			

get '/' do #this is my homepage, Let's Play TTT
	@title = 'Welcome to Tic Tac Toe'
	session[:board] = params[:board]	
	session[:board] = @ttt_board

	erb :welcome_page, :locals => {:board => session[:board], 
								   :current_player => session[:current_player], 
								   :message => " ", :welcome_message => "WELCOME!!", 
								   :enter => "Let's Play!"}
end

post '/player_one' do #player name enter
	@title = 'Player Name'
	
	session[:p1_name] = params[:p1_name]
	session[:p1] = Human.new("X")
	session[:current_player] = session[:p1]
	session[:current_player_name] = session[:p1_name]

	erb :player_name, :locals => {:board => session[:board], :p1_name => session[:p1_name]}							  	
end

post '/player_2_choice' do #select player mode page.
	@title = 'Game Mode'

	session[:p2] = params[:p2]
	erb :choose_game, :locals => {:board => session[:board], :p2 => session[:p2]}
end	

post '/rival' do #once selected mode should go to game
 @title = 'Rival'
  p2_name = params[:p2_name]

 	if session[:p2] == "Human"
     p2 = Human.new("O")

	 erb :player_name, :locals => {:board => session[:board], :p2_name => session[:p2_name],
	 							   :p2 => session[:p2]}
	end
end


# 	if session[:p2] == "SequentialAI"	
# 	 p2 = SequentialAI.new("O")
# 	 session[:CPU] = "Tom Riddle"

# 		redirect '/make_move'

# 	elsif session[:p2] == "RandomAI"
# 	 p2 = RandomAI.new("O")
# 	 session[:CPU] = "Tom Riddle"

# 		redirect '/make_move'

# 	else session[:p2] == "Human"
#      p2 = Human.new("O")

# 	 erb :player_name, :locals => {:board => session[:board], :p2_name => session[:p2_name],
# 	 							   :p2 => session[:p2]}
# 	end		
#  session[:current_player] = p2	
# end	

# get '/make_move' do
# 	session[:move] = params[:move].to_i
# 	session[:board] = update_board(session[:board], session[:move].to_i, session[:current_player][:marker])

# 		if game_won?(session[:board], session[:current_player].marker) == true
# 			erb :win, :locals => {:board => session[:board], :p1_marker => p1_marker, :p1_name => session[:p1_name],
# 								  :p2_marker => p2_marker, :p2_name => session[:name_player_2]}
								  
# 		else
# 			game_ends_in_tie? == true
# 			erb :tie, :locals => {:board => session[:board], :p1_marker => p1_marker, :p1_name => session[:p1_name],
# 								  :p2_marker => p2_marker, :p2_name => session[:name_player_2]}
								  
# 		end	

# 		if session[:current_player].marker == "X"
# 			session[:current_player] = session[:p2]
# 			session[:current_player_name] = session[:p2_name]
# 		else
# 			session[:current_player] = session[:p1]
# 			session[:current_player_name] = session[:p1_name]
# 		end

# 		erb :get_move, :locals => { :board => session[:board], :current_player => session[:current_player], 
# 									:p1 => session[:p1], :p1_marker => p1_marker, :p1_name => session[:p1_name],
# 									:p2 => session[:p2], :p2_marker => p2_marker, :p2_name => session[:name_player_2]}
# end


