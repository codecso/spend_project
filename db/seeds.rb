require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')

require('pry')

Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all()

tesco = Merchant.new({
  'name' => 'Tesco'
  })

tesco.save()

groceries = Tag.new({
  'name' => 'groceries'
  })

groceries.save()

transaction1 = Transaction.new({
  'merchant_id' => tesco.id(),
  'tag_id' => groceries.id(),
  'timing' => '23/08/2018',
  'amount' => 20
  })

transaction1.save()

binding.pry

nil
