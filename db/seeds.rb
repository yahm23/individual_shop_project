require_relative( '../models/artist.rb' )
require_relative( '../models/record_label.rb' )
require_relative( '../models/record.rb' )
require('pry-byebug')

Record.delete_all()
Artist.delete_all()
RecordLabel.delete_all()



artist1 = Artist.new({'name'=>'Pink Floyd'})
artist2 = Artist.new({'name'=>'Kendrick Lamar'})
artist3 = Artist.new({'name'=>'Stevie Wonder'})
artist1.save()
artist2.save()
artist3.save()


record_label1= RecordLabel.new({'name'=> 'Interscope Records', 'contact_info'=>'interscope@info.com'})
record_label1.save()

record_label2= RecordLabel.new({'name'=> 'Columbia Records', 'contact_info'=>'columbiarecs@info.com'})
record_label2.save()

record_label3= RecordLabel.new({'name'=> 'Motown Records', 'contact_info'=>'moTownrecs@info.com'})
record_label3.save()


record1 = Record.new({'name'=>'Wish You Were Here', 'description'=> 'The 9th studio album by the English rock band Pink Floyd', 'genre'=> 'Rock', 'buy_cost'=>2000 , 'sell_cost' => 2800, 'record_label_id' => record_label2.id, 'artist_id'=> artist1.id, 'quantity' => 10})
record1.save()

record2 = Record.new({'name'=>'DAMN.', 'description'=> 'DAMN. is the 4th studio album by Compton rapper Kendrick Lamar', 'genre'=> 'Hip-Hop', 'buy_cost'=>1500 , 'sell_cost' => 2500, 'record_label_id' =>record_label1.id , 'artist_id'=>artist2.id , 'quantity' => 15})
record2.save()

record3 = Record.new({'name'=>'Talking Book', 'description'=> "Stevie Wonder's 15th studio album, an instant classic", 'genre'=> 'Soul/Funk', 'buy_cost'=>3000 , 'sell_cost' =>4500 , 'record_label_id' => record_label3.id , 'artist_id'=>artist3.id , 'quantity' => 19 })
record3.save()

record4 = Record.new({'name'=>'The Wall', 'description'=> 'The Wall is the 11th studio album by Pink Floyd', 'genre'=> 'Progressive Rock', 'buy_cost'=>4000 , 'sell_cost' =>5000 , 'record_label_id' =>record_label2.id , 'artist_id'=>artist1.id , 'quantity' => 4})
record4.save()


binding.pry
nil
