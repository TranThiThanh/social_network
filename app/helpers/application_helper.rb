module ApplicationHelper
  def is_current? user
    user == current_user
  end
end
