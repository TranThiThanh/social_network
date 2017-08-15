module ApplicationHelper
  def is_current? user
    user == current_user
  end

  def build_invitations user
    user.invitations.build(group_id: @group.id)
  end
end
