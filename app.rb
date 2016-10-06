require 'sinatra'
require_relative 'sequentialAI.rb'
require_relative 'randomAI.rb'
require_relative 'console_game.rb'


enable :sessions

get '/wiki_rules' do
	@title = 'Wiki'

	erb :wiki_rules
end

get '/rubbish' do
	@title = 'Full of Rules'

	erb :rubbish
end			

get '/' do #this is my homepage
	session[:board] = params[:board]	
	session[:board] = @ttt_board

	erb :welcome_page, :locals => {:board => session[:board]}
end	

post '/input' do #choosing a game type
	session[:p1] = params[:player_one]
	session[:p2] = params[:player_two]

	erb :choose_game, :locals => {:player_one => session[:p1], :player_two => session[:p2]}
end	

# post '/player_mode' do #choose player mode
# 	p1_marker = params[:p1_marker]
# 	p2_marker = params[:p2_marker]
# 	session[:p1] = p1_marker
# 	session[:p2] = p2_marker
	
# 	p1_marker = "X"
# 	p2_marker = "O"

# 	if session[:p1] == "SequentialAI" 
# 		p1_marker = SequentialAI.new("X")
# 	else session[:p1] == "RandomAI"
# 		p1_marker = RandomAI.new("X")	
# 	end

# 	if session[:p2] == "SequentialAI"	
# 		p2_marker = SequentialAI.new("O")
# 	else session[:p2] == "RandomAI"
# 		p2_marker = RandomAI.new("O")
# 	end			

# 	erb :play_game, :locals => {:board => session[:board], :p1_marker => p1_marker, 
# 		:p2_marker => p2_marker}

# end	
