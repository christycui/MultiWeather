module ApplicationHelper
  def name_of_day(date)
    t = Time.now
    if date == t.strftime('%F')
      'Today'
    else
      # return weekday
      Time.new(date[0..3].to_i, date[5..6].to_i, date[8..9].to_i).strftime('%A')
    end
  end
end
