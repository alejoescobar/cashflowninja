module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end

  class Calendar < Struct.new(:view, :date, :callback)

    HEADER = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    START_DAY = :sunday

    delegate :content_tag, to: :view

    def table
      # total_income
      content_tag :table, class: "calendar" do
        header + total_income
      end
    end

    def header
    header = []
    start_month = date.prev_month
    7.times {
      start_month = start_month.next_month
      header.push(start_month)
    }
      content_tag :tr do
        header.map { |x|
          content_tag :th,
            x.strftime("%B")
         }.join.html_safe
      end
    end

    def total_income
      recurrent_income = RecurrentIncome.all
      monthly_income = 0
      header = []
      start_month = date.prev_month
      7.times {
        start_month = start_month.next_month
        header.push(start_month)
      }
      content_tag :tr do
        header.map { |month|
          puts month.strftime("%B")
          recurrent_income.each do |test|
            test.recurrent_hash.each do |test1|
              if month.strftime("%m-%Y") == test1.strftime("%m-%Y")
                monthly_income += test.recurrent_hash.options[:income][:amount]
              end
            end
          end
          content_tag :td,
            monthly_income
        }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end

# module CalendarHelper
#   def calendar(date = Date.today, &block)
#     Calendar.new(self, date, block).table
#   end

#   class Calendar < Struct.new(:view, :date, :callback)
#     HEADER = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
#     START_DAY = :sunday

#     delegate :content_tag, to: :view

#     def table
#       content_tag :table, class: "calendar" do
#         header + week_rows
#       end
#     end

#     def header
#       content_tag :tr do
#         HEADER.map { |day| content_tag :th, day }.join.html_safe
#       end
#     end

#     def week_rows
#       weeks.map do |week|
#         content_tag :tr do
#           week.map { |day| day_cell(day) }.join.html_safe
#         end
#       end.join.html_safe
#     end

#     def day_cell(day)
#       content_tag :td, view.capture(day, &callback), class: day_classes(day)
#     end

#     def day_classes(day)
#       classes = []
#       classes << "today" if day == Date.today
#       classes << "notmonth" if day.month != date.month
#       classes.empty? ? nil : classes.join(" ")
#     end

#     def weeks
#       first = date.beginning_of_month.beginning_of_week(START_DAY)
#       last = date.end_of_month.end_of_week(START_DAY)
#       (first..last).to_a.in_groups_of(7)
#     end
#   end
# end