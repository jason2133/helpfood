# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  #before_action :configure_account_update_params, only: [:update]
  include Accessible
<<<<<<< HEAD
  ## for current password문제 
  def update

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    
       if resource.update_with_password(params[resource_name])
         set_flash_message :notice, :updated if is_navigational_format?
         sign_in resource_name, resource, :bypass => true
         respond_with resource, :location => after_update_path_for(resource)
       else
         clean_up_passwords(resource)
         respond_with_navigational(resource){ render_with_scope :edit }
       end

    end

=======
  
>>>>>>> 449f5595f295d469784be3e48162dcee59489d55
  ## for editsns 
  def edit
    # render :edit
  end   

  def editsns
    # render :editsns
<<<<<<< HEAD
=======
    # @profile_id = Profile.where(user_id: current_user.id).pluck(:id)
>>>>>>> 449f5595f295d469784be3e48162dcee59489d55
  end
  
  # GET /resource/sign_up
 # def new
   #   super
  #end

  # POST /resource
  #def create
<<<<<<< HEAD
  #super
=======
    # Profile.create!(user_id: user.id)
>>>>>>> 449f5595f295d469784be3e48162dcee59489d55
  #end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

<<<<<<< HEAD
 protected

=======
>>>>>>> 449f5595f295d469784be3e48162dcee59489d55
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
<<<<<<< HEAD
  def after_update_path_for(resource)
    redirect_to new_profile_path_url
  end

  # The path used after sign up.
 def after_sign_up_path_for(resource)
  redirect_to new_profile_path_url
  end

  # The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
    redirect_to new_profile_path_url
   end
=======
>>>>>>> 449f5595f295d469784be3e48162dcee59489d55
end
