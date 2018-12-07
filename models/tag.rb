require_relative('../db/sql_runner.rb')

class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
  end

end
