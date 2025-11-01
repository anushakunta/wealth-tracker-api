user = User.find_or_create_by!(email: 'demo@example.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
end

today = Date.today
start_date = (today << 3)

(start_date..today).each do |d|
  if d.day == 1
    user.transactions.create!(amount: 5000, category: 'salary', transaction_type: 'income', date: d)
  end
  if [5,15,25].include?(d.day)
    user.transactions.create!(amount: rand(80..180), category: 'groceries', transaction_type: 'expense', date: d)
  end
  if d.day == 10
    user.transactions.create!(amount: 1500, category: 'rent', transaction_type: 'expense', date: d)
  end
  if d.day == 20
    user.transactions.create!(amount: rand(200..700), category: 'investment', transaction_type: 'expense', date: d)
  end
end
puts "Seeded demo user and transactions"
