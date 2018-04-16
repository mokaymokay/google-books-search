require 'sinatra'
require 'sinatra/reloader'
require 'googlebooks'

get '/' do
  erb :index
end

post '/results' do
  book = GoogleBooks.search(params[:query]).first || nil
  if book != nil
    erb :results, :locals => {'book' => book}
  else
    halt 404, "No results found, please try again."
    erb :results
  end
end
