require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
require_relative('../models/artist.rb')
require_relative('../models/record_label.rb')
also_reload( '../models/*' )



get '/inventory' do
  @records = Record.all
  @artists = Artist.all
  @record_label_ids = RecordLabel.all.map { |label|  label.id}
  @artist_ids = Artist.all.map { |artist|  artist.id}
  @record_labels = RecordLabel.all
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


get '/inventory/record_label/:id' do
  @label_id = params['id'].to_i
  @records = Record.all
  @artists = Artist.all
  @record_label_ids = RecordLabel.all.map { |label|  label.id}
  @record_labels = RecordLabel.all
  @artist_ids = Artist.all.map { |artist|  artist.id}
  erb(:'inventory/record_label')
end

get '/inventory/artist/:id' do
  @label_id = params['id'].to_i
  @records = Record.all
  @artists = Artist.all
  @record_label_ids = RecordLabel.all.map { |label|  label.id}
  @record_labels = RecordLabel.all
  @artist_ids = Artist.all.map { |artist|  artist.id}
  erb(:'inventory/artist')
end

post '/inventory/artist' do
  id_filter = params[:artist_id].to_i
  redirect to "/inventory/artist/#{id_filter}"
end

post '/inventory/record_label' do
  id_label = params[:record_label_id].to_i
  redirect to "/inventory/record_label/#{id_label}"
end

post '/inventory' do
  params[:buy_cost] = 100*params[:buy_cost].to_i
  params[:sell_cost] = 100*params[:sell_cost].to_i
  record = Record.new(params)
  record.save()
  redirect to ('/inventory')
end


post '/inventory/:id/delete' do
  Record.delete(params[:id].to_i)
  redirect to ('/inventory')
end

post '/inventory/:id' do
  params[:buy_cost] = 100*params[:buy_cost].to_i
  params[:sell_cost] = 100*params[:sell_cost].to_i
  rec = Record.new(params)
  rec.update
  redirect to "/inventory"
end


post '/inventory/:id/edit' do
  @record_labels = RecordLabel.all
  @artists = Artist.all
  @record = Record.find_by_id(params['id'])
  erb (:'inventory/edit')
end
