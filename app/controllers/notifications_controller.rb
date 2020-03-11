class NotificationsController < ApplicationController
  def index
  end

  def edit
    current_user[:frequency] = params[:notifications][:frequency]
    current_user[:medium] = params[:notifications][:medium]
    # current_user[:notification_size] = params[:notifications][:notification_size]
    #current_user.save!
   if current_user.save
      UserMailer.with(user: current_user).newsletter.deliver_now if current_user[:frequency] == "Demo - deliver now"
      redirect_to contents_path
    else
      render :index
    end
  end
end
