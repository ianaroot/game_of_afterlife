require 'sinatra'
require 'json'

require './app'


get '/' do
  @@board = Board.new(HumanoidBuilder.populate(40,10), 400, 600)
  erb :main
end

get '/update' do
  puts params
  next_turn = @@board.next_turn
  next_turn ? next_turn.map{|humanoid| {type: humanoid.type, position: humanoid.position} }
  .to_json : [].to_json
end