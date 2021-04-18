module ApplicationHelper

  def current_action_name
    if %w(new create).include?(action_name.to_s)
      'New'
    elsif %w(edit update).include?(action_name.to_s)
      'Edit'
    else
      action_name.to_s.titleize
    end
  end
end

  def display_date(date)
    date.present? ? date.in_time_zone('Mumbai').strftime("%d %b, %Y %l:%M %p") : 'NA'
  end

  def compair_date(date)
    if date.present? 
      return date.to_i < Time.now.to_i
    else 
      return false
    end
  end
