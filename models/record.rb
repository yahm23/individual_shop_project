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

  def save()
    sql = "INSERT INTO records (name, description, genre, buy_cost, sell_cost, record_label_id, artist_id, quantity)
    VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING id"
    values = [@name, @description, @genre, @buy_cost, @sell_cost, @record_label_id, @artist_id, @quantity]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def update()
    sql = "UPDATE records SET (name, description, genre, buy_cost, sell_cost, record_label_id, artist_id, quantity)= ($1,$2,$3,$4,$5,$6,$7,$8) WHERE id = $9"
    values = [@name, @description, @genre, @buy_cost, @sell_cost, @record_label_id, @artist_id, @quantity, @id]
    SqlRunner.run(sql,values)

  end


  def quantity_check(num)
    if @quantity > num
      return true
    else
      return false
    end
  end

  def quantity_add(num)\
    @quantity += num
  end


  def self.all
    sql = "SELECT * FROM records;"
    output = SqlRunner.run(sql)
    record_labels = output.map{|label| Record.new(label)}
  end

  def self.find_by_id(id)
    sql ='SELECT * FROM records WHERE id =$1;'
    values= [id]
    record = Record.new(SqlRunner.run(sql,values)[0])
    return record
  end

  def self.delete_all
    sql = "DELETE FROM records"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM records WHERE id = $1"
    values=[id]
    output = SqlRunner.run(sql,values)
  end

end
