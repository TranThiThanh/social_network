class StaticPagesController < ApplicationController
  skip_before_action :require_login
  def about
  end

  def contact_help
  end

  def privacy
  end

  def terms
  end
end
