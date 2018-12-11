require_relative('../db/sql_runner.rb')
require_relative('./merchant.rb')
require_relative('./tag.rb')

class Transaction

  attr_reader :id, :tag_id, :merchant_id
  attr_accessor :timing, :amount

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @tag_id = options['tag_id'].to_i()
    @merchant_id = options['merchant_id'].to_i()
    @timing = options['timing']
    @amount = options['amount'].to_i()
  end

  def save()
    sql = "INSERT INTO transactions (tag_id, merchant_id, timing, amount) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@tag_id, @merchant_id, @timing, @amount]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"]
  end

  def update()
    sql = "UPDATE transactions SET (tag_id, merchant_id, timing, amount) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@tag_id, @merchant_id, @timing, @amount, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map {|transaction_hash| Transaction.new(transaction_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results.first)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@merchant_id]
    result = SqlRunner.run(sql, values)
    return Merchant.new(result.first)
  end

  def tag()
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [@tag_id]
    result = SqlRunner.run(sql, values)
    return Tag.new(result.first)
  end

  def self.transaction_date_ascending()
    sql = "SELECT * FROM transactions ORDER BY timing"
    results = SqlRunner.run(sql)
    return results.map {|transaction_hash| Transaction.new(transaction_hash)}
  end

  def self.transaction_date_descending()
    sql = "SELECT * FROM transactions ORDER BY timing DESC"
    results = SqlRunner.run(sql)
    return results.map {|transaction_hash| Transaction.new(transaction_hash)}
  end

end
