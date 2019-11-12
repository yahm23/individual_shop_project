require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record_label.rb')
also_reload( '../models/*' )



get '/record_labels' do
  @record_labels = RecordLabel.all
  erb (:'record_labels/index')
end

get '/record_labels/new'do
  erb(:'record_labels/new')
end

get '/record_labels/:id' do
  @record_label = RecordLabel.find_by_id(params['id'].to_i)
  @records = @record_label.records()
  # @mssg = "No Records for this label"
  erb (:'record_labels/show')
end

post '/record_labels/:id/delete' do
  RecordLabel.delete(params[:id])
  redirect to ('/record_labels')
end

post '/record_labels' do
  label1 = RecordLabel.new(params)
  label1.save()
  redirect to ('/record_labels')
end
