class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  def home
    if user_signed_in?
      redirect_to projects_path
    end
  end

  def about
  end

  def sandbox
    # place to play with code, remove when done playing around and app is finished, or don't want it to be in the routes
    respond_to do |format|
        format.html
        format.json {}
    end
  end
end
