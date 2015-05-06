module ReportsHelper
  def selected_months(start_date, end_date)
    @date_array = []
    months_number = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)
    months_number.times do |x|
      if start_date < end_date
        @date_array.push(start_date)
        start_date = start_date.next_month
      end
    end
    @date_array
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
    @total_cash_array
  end

  def report_total_income
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

  def report_total_expense
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
