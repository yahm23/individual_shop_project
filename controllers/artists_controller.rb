require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
also_reload( '../models/*' )
