require 'sinatra'
require 'sinatra/reloader'
require 'googlebooks'

get '/' do
  erb :index
end

post '/' do
  books = GoogleBooks.search(params[:query]) || nil
  if books
    erb :results, :locals => {'books' => books}
  else
    # TODO: fix error handling
    halt 404, "No results found, please try again."
    erb :results
  end
end
