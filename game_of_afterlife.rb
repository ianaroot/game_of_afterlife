require 'sinatra'
require 'json'

require './app'


get '/' do
  @@board = Board.new(HumanoidBuilder.populate(20,5), 600, 400)
  erb :main
end

get '/update' do
  puts params
  @@board.next_turn
  .map{|humanoid| {type: humanoid.type, position: humanoid.position} }
  .to_json
end