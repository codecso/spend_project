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


end
