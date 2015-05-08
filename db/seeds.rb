# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# u = User.create!(name:"Alejandro", company_name: "Applicando", email:"alejoescobac@gmail.com", password:"12345678" )

# income_categories = ["Customer Sales", "Investments", "Other income", "Interest", "Business Sales"]
# expense_categories = ["Payroll", "Lease", "Inventory", "Other expenditure", "Services"]

# income_categories.each do |category|
#   Category.create(name:category, transaction_type: 0, company_id: u.companies.first.id)
# end
# expense_categories.each do |category|
#   Category.create(name:category, transaction_type: 1, company_id: u.companies.first.id)
# end

# projects = ["Main Product 1", "Main Product 2", "New Product 1", "New Product 2", "Testing Product"]

# projects.each do |project|
#   Project.create(name:project, company_id: u.companies.first.id)
# end

# # Test transactions
# Income.create!(name:"Non-Recurrent", amount: 10000000, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 0, end_date: Date.today)