class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def home
    if user_signed_in?
      redirect_to projects_path
    end
  end

  def about
  end
end
