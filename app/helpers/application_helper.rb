module ApplicationHelper
  def cap_name
    current_user.email.split('@').first.capitalize
  end
end
