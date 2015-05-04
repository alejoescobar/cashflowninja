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
