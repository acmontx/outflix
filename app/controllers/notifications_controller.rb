class NotificationsController < ApplicationController
  def index
  end

  def edit
    current_user[:frequency] = params[:notifications][:frequency]
    current_user[:medium] = params[:notifications][:medium]
    # current_user[:notification_size] = params[:notifications][:notification_size]
    current_user.save!
  end

end
