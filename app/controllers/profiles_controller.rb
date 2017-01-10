class ProfilesController < ApplicationController
  
  # Get to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile
  def create
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile updated"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  
  def edit
    @user = User.find( params[:user_id] )
    @profile = @user.profile
  end
  private
    def profile_params
      params.require(:profile).permit(:user_name, :first_name, :last_name, :avatar, :phone_number, :contact_email, :description)
    end
end