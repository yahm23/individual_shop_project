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
