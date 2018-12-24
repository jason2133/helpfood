class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  protected
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :email, :password,:profileimage, :ages, :is_Brand, :etc, :phonenum, :registerimg ,:shop_name, :shop_num, :shop_info, allergy:[] ] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :email, :password,:profileimage, :ages, :is_Brand, :etc, :phonenum, :registerimg ,:shop_name, :shop_num, :shop_info, allergy:[] ])
  end
 
  #sessions공유
  # alias_method :devise_current_user, :current_user
  # def current_user
    # devise_current_user || current_owner
  # end
  def after_sign_in_path_for(resource)
   # if Profile.exists?(user_id: current_user.id)
      return profile_path(current_user.id)
    #  puts "있다"
    #else
   #return new_profile_path #userid와 profileid가 무조건같아야한다.
  #end
end
  
  def after_update_path_for(resource)
    @profile_id = current_user.id
    redirect_to profile_path(@profile_id) #userid와 profileid가 무조건같아야한다.
  end 
end