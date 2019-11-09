require_relative( '../models/artist.rb' )
require_relative( '../models/record_label.rb' )
require_relative( '../models/record.rb' )
require('pry-byebug')

Record.delete_all()
Artist.delete_all()
RecordLabel.delete_all()



artist1 = Artist.new({'name'=>'Pink Floyd'})
artist2 = Artist.new({'name'=>'Kendrick Lamar'})
artist1.save()
artist2.save()


record_label1= RecordLabel.new({'name'=> 'Interscope Records', 'contact_info'=>'interscope@info.com'})
record_label1.save()

record_label2= RecordLabel.new({'name'=> 'Columbia Records', 'contact_info'=>'columbiarecs@info.com'})
record_label2.save()


record1 = Record.new({'name'=>'Wish You Were Here', 'description'=> 'Wish You Were Here is the 9th studio album by the English rock band Pink Floyd', 'genre'=> 'Rock', 'buy_cost'=>20000 , 'sell_cost' => 28000, 'record_label_id' => record_label2.id, 'artist_id'=> artist1.id, 'quantity' => 10})
record1.save()

record2 = Record.new({'name'=>'DAMN.', 'description'=> 'DAMN. is the 4th studio album by Compton rapper Kendrick Lamar', 'genre'=> 'Hip-Hop', 'buy_cost'=>15000 , 'sell_cost' => 25000, 'record_label_id' =>record_label1.id , 'artist_id'=>artist2.id , 'quantity' => 15})
record2.save()
# record1 = Record.new({'name'=>'', 'description'=> '', 'genre'=> '', 'buy_cost'=> , 'sell_cost' => , 'record_label_id' => , 'artist_id'=> , 'quantity' => })
# record1 = Record.new({'name'=>'', 'description'=> '', 'genre'=> '', 'buy_cost'=> , 'sell_cost' => , 'record_label_id' => , 'artist_id'=> , 'quantity' => })

binding.pry
nil
