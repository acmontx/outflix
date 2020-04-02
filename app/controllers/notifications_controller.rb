class NotificationsController < ApplicationController
  def index # /notifications
  end

  def update
    if current_user.update(user_params)
      # For demo purposes the email or sms are sent now
      if user_params[:frequency] == "Demo - deliver now"
        if user_params[:medium] == 'Email'
          # If the user chooses email notification the user mailer is called to
          # deliver the newsletter email now
          UserMailer.with(user: current_user).newsletter.deliver_now
          # The user sees a notice that the email was sent now
          flash[:notice] = "We've sent you an email. Check your inbox!"
        else
          # If the user chooses SMS notification the send_ext_message is called
          # to deliver the newsletter sms now via Twilio
          current_user.send_text_message
          # The user sees a notice that the SMS was sent now
          flash[:notice] = "We've sent you an SMS. Check your phone!"
        end
      else
        # If the user sets weekly or monthly notifications the user sees a
        # notice saying that their preferences are set
        # Their frequency and medium will be used on rake tasks to determine
        # when they'll receive their notifications
        flash[:notice] = "Your notification preferences are set!"
      end

      # On save, we redirect to the dashboard (contents index)
      redirect_to contents_path
    else
      # We redirect to the dashboard (contents index)
      render :index
    end
  end

  private

  def user_params
    # Allow the below attributes to be updated via the form
    params.require(:user).permit(:medium, :frequency, :phone_number)
  end
end
