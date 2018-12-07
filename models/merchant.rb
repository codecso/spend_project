require_relative('../db/sql_runner.rb')
require_relative('./transaction.rb')

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
  end

end
