require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/artists_controller.rb')
require_relative('controllers/record_labels_controller.rb')
require_relative('controllers/inventory_controller.rb')
also_reload( '../models/*' )


get '/' do
  erb( :index )
end
