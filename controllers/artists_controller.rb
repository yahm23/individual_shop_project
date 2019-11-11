require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
require_relative('../models/record.rb')
require_relative('../models/record_label.rb')
also_reload( '../models/*' )



get '/artists' do
   @artists = Artist.all
  erb (:"artists/index")
end

get '/artists/new'do
  erb(:'artists/new')
end

get '/artists/:id' do
  @artist = Artist.find_by_id(params['id'].to_i)
  @records = @artist.records()
  erb (:'artists/show')
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to ('/artists')
end
