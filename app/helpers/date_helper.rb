module DateHelper
  def current_date
    Date.today.to_formatted_s(:long)
  end
end