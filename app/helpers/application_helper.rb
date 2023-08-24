module ApplicationHelper
  def formatted_datetime(datetime)
    formatted_date = datetime.strftime("%d de %B")
    formatted_time = datetime.strftime("%l:%M %p").strip

    if datetime.hour < 12
      formatted_time.sub!("AM", "am")
    else
      formatted_time.sub!("PM", "pm")
    end

    "#{formatted_date} a las #{formatted_time}"
  end
end
