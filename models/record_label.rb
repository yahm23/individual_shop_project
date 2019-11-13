require_relative( '../db/sql_runner' )
require('pry-byebug')

class RecordLabel
  attr_reader :id
  attr_accessor :name, :contact_info


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_info = options['contact_info']
  end

  def save()
    sql = "INSERT INTO record_labels (name,contact_info) VALUES ($1,$2) RETURNING id;"
    values = [@name,@contact_info]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def update()
    sql = "UPDATE record_labels SET (name, contact_info)= ($1,$2) WHERE id = $3;"
    values = [@name, @contact_info, @id]
    SqlRunner.run(sql,values)
  end


  def records()
    sql = "SELECT * FROM records WHERE record_label_id = $1"
    value = [@id]
    output = SqlRunner.run(sql,value)
    return output.map{|record| Record.new(record)}
  end

  def self.all
    sql = "SELECT * FROM record_labels;"
    output = SqlRunner.run(sql)
    record_labels = output.map{|label| RecordLabel.new(label)}
  end


  def self.find_by_id(id)
    sql ='SELECT * FROM record_labels WHERE id =$1;'
    values= [id]
    label = RecordLabel.new(SqlRunner.run(sql,values)[0])
    return label
  end

  def self.delete_all
    sql = "DELETE FROM record_labels"
    SqlRunner.run(sql)
  end

  def self.delete(id)

    sql = "DELETE FROM record_labels WHERE id = $1"
    values=[id]
    output = SqlRunner.run(sql,values)
  end






end
