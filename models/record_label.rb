require_relative( '../db/sql_runner' )

class RecordLabel
  attr_reader :id
  attr_accessor :name, :contact_info


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_info = options['contact_info']
  end





end
