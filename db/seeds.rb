require_relative( '../models/artist.rb' )
require_relative( '../models/record_label.rb' )
require_relative( '../models/record.rb' )
require('pry-byebug')

artist1 = Artist.new({'name'=>'Pink Floyd'})
artist1.save()


record_label1= RecordLabel.new({'name'=> 'Interscope Records', 'contact_info'=>'interscope@info.com'})
record_label1.save()
