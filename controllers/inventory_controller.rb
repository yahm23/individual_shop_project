require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
require_relative('../models/artist.rb')
require_relative('../models/record_label.rb')
also_reload( '../models/*' )



get '/inventory' do
  @records = Record.all
  erb (:"inventory/index")
end

get '/inventory/new' do
  @record_labels = RecordLabel.all
  @artists = Artist.all
  erb(:'inventory/new')
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
