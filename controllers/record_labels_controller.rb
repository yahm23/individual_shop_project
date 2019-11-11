require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record_label.rb')
also_reload( '../models/*' )



get '/record_labels' do
  @record_labels = RecordLabel.all
  erb (:'record_labels/index')
end


get '/record_labels/:id' do
  @record_label = RecordLabel.find_by_id(params['id'].to_i)
  @records = @record_label.records()
  erb (:'record_labels/show')
end
