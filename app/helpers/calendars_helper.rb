module CalendarsHelper
  def months_header
    @date_array = []
    8.times do |month|
      @date_array.push(@date)
      @date = @date.next_month
    end
    @date_array
  end

  def total_income
    @total_income = 0
    @total_income_array = []
    months_header.each do |month|
      @recurrent_income.each do |recurrent|
        recurrent.recurrent_hash.each do |date|
          if month.strftime("%m-%Y") == date.strftime("%m-%Y")
            @total_income += recurrent.recurrent_hash.options[:income][:amount]
          end
        end
      end
      @total_income_array.push(@total_income)
    end
    @total_income_array
  end


end
