require_relative( '../db/sql_runner' )

class Record
  attr_reader :id
  attr_accessor :name,:description,:genre, :buy_cost, :sell_cost,:record_label_id, :artist_id, :quantity

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description =options['description']
    @genre = options['genre']
    @buy_cost = options['buy_cost'].to_i
    @sell_cost = options['sell_cost'].to_i
    @record_label_id = options['record_label_id'].to_i
    @artist_id = options['artist_id'].to_i
    @quantity = options['quantity'].to_i
  end






end
