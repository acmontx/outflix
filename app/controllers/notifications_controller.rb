class NotificationsController < ApplicationController
  def index
  end

  def update
    if current_user.update(user_params)
      if user_params[:frequency] == "Demo - deliver now"
        if user_params[:medium] == 'Email'
          UserMailer.with(user: current_user).newsletter.deliver_now
          flash[:notice] = "We've sent you an email. Check your inbox!"
        else
          current_user.send_text_message
          flash[:notice] = "We've sent you an SMS. Check your phone!"
        end
      else
        flash[:notice] = "Your notification preferences are set!"
      end

      redirect_to contents_path
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:medium, :frequency, :phone_number)
  end
end
