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
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
  end

  def update()
    sql = "UPDATE tags SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return results.map {|tag_hash| Tag.new(tag_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results.first)
  end

  def transactions()
    sql = "SELECT * FROM transactions WHERE tag_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map{|transaction| Transaction.new(transaction)}
  end

  def transaction_count()
    sql = "SELECT COUNT(*) from transactions WHERE tag_id = $1"
    values = [@id]
    transactions = SqlRunner.run(sql, values)
    return transactions[0]["count"]
  end

end
