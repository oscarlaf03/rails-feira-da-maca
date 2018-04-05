=begin
def kill_products
  counter_kill = 0
  puts 'killing products'
  Product.all.each do |x|
    counter_kill += 1
    x.destroy
    puts "#{counter_kill} products killed"
  end
end

def kill_users
  counter_kill = 0
  puts 'killing users'
  User.all.each do |x|
    counter_kill += 1
    x.destroy
    puts "#{counter_kill} users killed"
  end
end

def kill_all
  puts 'Prepare to kill everything'
  kill_products
  kill_users
  puts "Surviving Products:#{Product.count}"
  puts "Surviving Users:#{User.count}"
end

=end
