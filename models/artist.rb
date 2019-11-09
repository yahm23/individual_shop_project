require_relative( '../db/sql_runner' )

class Artist
attr_reader :id
attr_accessor :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    output = SqlRunner.run(sql,values)[0]
    @id = output['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artists"
    output = SqlRunner.run(sql)
    artists = output.map{|artist| Artist.new(artist)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    artist = SqlRunner.run(sql,values)[0]
    return Artist.new(artist)
  end



end
