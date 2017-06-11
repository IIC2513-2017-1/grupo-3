module UsersHelper

  def users_chart_data
    (5.weeks.ago.to_date..Date.today).map do |date|
      {
        created_at: date,
        quantity: User.where("date(created_at) = ?", date).count
      }
    end
  end

end
