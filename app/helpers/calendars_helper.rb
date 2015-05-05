module CalendarsHelper
  def months_header
    @date_array = []
    8.times do |month|
      @date_array.push(@date)
      @date = @date.next_month
    end
    puts @date_array.count
    @date_array
  end

  def initial_cash
    counter = 0
    @initial_cash = 0
    @account = Account.first
    @account.incomes.each do |income|
      income.recurrent_income.recurrent_hash.each do |date|
        if date <= @date_array.first.prev_month
          counter += 1
        end
      end
      @initial_cash += counter * income.recurrent_income.recurrent_hash.options[:income][:amount]
      counter = 0
    end
    @account.expenses.each do |expense|
      expense.recurrent_expense.recurrent_hash.each do |date|
        if date <= @date_array.first.prev_month
          counter += 1
        end
      end
      @initial_cash -= counter * expense.recurrent_expense.recurrent_hash.options[:expense][:amount]
      counter = 0
    end
    @initial_cash
  end

  def cash_on_hand
    initial_cash
    @account = Account.first
    @total_cash_array = []
    @date_array.each do |month|
      @account.incomes.each do |income|
        income.recurrent_income.recurrent_hash.each do |date|
          if month == @date_array.first
            @initial_cash
          elsif month.prev_month.strftime("%B %Y") == date.strftime("%B %Y")
            @initial_cash += income.recurrent_income.recurrent_hash.options[:income][:amount]
          end
        end
      end
      @account.expenses.each do |expense|
        expense.recurrent_expense.recurrent_hash.each do |date|
          if month.prev_month.strftime("%B %Y") == date.strftime("%B %Y")
            @initial_cash -= expense.recurrent_expense.recurrent_hash.options[:expense][:amount]
          end
        end
      end
      @total_cash_array.push(@initial_cash)
    end
    puts "************** hello"
    puts @total_cash_array
    puts "**************"
    @total_cash_array
  end

  def total_income
    @total_income = 0
    @total_income_array = []
    @date_array.each do |month|
      @recurrent_incomes.each do |recurrent|
        recurrent.recurrent_hash.each do |date|
          if month.strftime("%B %Y") == date.strftime("%B %Y")
            @total_income += recurrent.recurrent_hash.options[:income][:amount]
          end
        end
      end
      @total_income_array.push(@total_income)
      @total_income = 0
    end
    @total_income_array
  end


  def total_expense
    @total_expense = 0
    @total_expense_array = []
    @date_array.each do |month|
      @recurrent_expenses.each do |recurrent|
        recurrent.recurrent_hash.each do |date|
          if month.strftime("%B %Y") == date.strftime("%B %Y")
            @total_expense += recurrent.recurrent_hash.options[:expense][:amount]
          end
        end
      end
      @total_expense_array.push(@total_expense)
      @total_expense = 0
    end
    @total_expense_array
  end


end
