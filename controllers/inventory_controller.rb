require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
require_relative('../models/artist.rb')
require_relative('../models/record_label.rb')
also_reload( '../models/*' )



get '/inventory' do
  @records = Record.all
  @record_label_ids = RecordLabel.all.map { |label|  label.id}
  @artist_ids = Artist.all.map { |artist|  artist.id}
  erb (:"inventory/index")
end

get '/inventory/new' do
  @record_labels = RecordLabel.all
  @artists = Artist.all
  erb(:'inventory/new')
end

get '/inventory/:id' do
  @record= Record.find_by_id(params['id'])
  erb(:'inventory/show')
end

post '/inventory' do
  record = Record.new(params)
  record.save()
  redirect to ('/inventory')
end

post '/inventory/:id/delete' do
  Record.delete(params[:id].to_i)
  redirect to ('/inventory')
end

post '/inventory/:id' do
  rec = Record.new(params)
  rec.update
  redirect to "/inventory/#{params['id']}"
end

post '/inventory/:id/edit' do
  @record_labels = RecordLabel.all
  @artists = Artist.all
  @record = Record.find_by_id(params['id'])
  erb (:'inventory/edit')
end
