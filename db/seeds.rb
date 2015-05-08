# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.create!(name:"Alejandro", company_name: "Applicando", email:"alejoescobac@gmail.com", password:"12345678" )

income_categories = ["Customer Sales", "Investments", "Other income", "Interest", "Business Sales"]
expense_categories = ["Payroll", "Lease", "Inventory", "Other expenditure", "Services"]

income_categories.each do |category|
  Category.create(name:category, transaction_type: 0, company_id: u.companies.first.id)
end
expense_categories.each do |category|
  Category.create(name:category, transaction_type: 1, company_id: u.companies.first.id)
end

projects = ["Main Product 1", "Main Product 2", "New Product 1", "New Product 2", "Testing Product"]

projects.each do |project|
  Project.create(name:project, company_id: u.companies.first.id)
end

# Test transactions
Income.create!(name:"Non-Recurrent", amount: 10000000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), account_id: u.companies.first.accounts.first.id,date: Date.today, recurrence: 0, end_date: Date.today)
Income.create!(name:"Daily-Recurrent", amount: 1000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 1, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Daily Non-Recurrent", amount: 1000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 1, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Weekly-Recurrent", amount: 100000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 2, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Weekly Non-Recurrent", amount: 100000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 2, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Monthly-Recurrent", amount: 700000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 3, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Monthly Non-Recurrent", amount: 700000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 3, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Yearly-Recurrent", amount: 10000000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 4, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Income.create!(name:"Yearly Non-Recurrent", amount: 10000000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(1..5), date: Date.today, recurrence: 4, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)

# Expense.create!(name:"Non-Recurrent", amount: 8000000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), account_id: u.companies.first.accounts.first.id, date: Date.today, recurrence: 0, end_date: Date.today)
# Expense.create!(name:"Daily-Recurrent", amount: 800, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 1, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
# Expense.create!(name:"Daily Non-Recurrent", amount: 1100, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 1, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)
Expense.create!(name:"Weekly-Recurrent", amount: 7500, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 2, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Expense.create!(name:"Weekly Non-Recurrent", amount: 8000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 2, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)
Expense.create!(name:"Monthly-Recurrent", amount: 650000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 3, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Expense.create!(name:"Monthly Non-Recurrent", amount: 850000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 3, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)
Expense.create!(name:"Yearly-Recurrent", amount: 15000000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 4, end_date: Date.today, account_id: u.companies.first.accounts.first.id)
Expense.create!(name:"Yearly Non-Recurrent", amount: 8000000, company_id: u.companies.first.id, project_id:rand(1..5), category_id:rand(6..10), date: Date.today, recurrence: 4, end_date: Date.today + 1.year, account_id: u.companies.first.accounts.first.id)