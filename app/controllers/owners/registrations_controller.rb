# frozen_string_literal: true

class Owners::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  include Accessible
  skip_before_action :check_user, except: [:new, :create]

  # GET /resource/sign_up
  def new
  
    $rt_num = params[:rt_num]
    if params[:rt_num]
      url ="http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?ldong_addr_mgpl_dg_cd=41&ldong_addr_mgpl_sggu_cd=117&ldong_addr_mgpl_sggu_emd_cd=101&wkpl_nm=&bzowr_rgst_no=#{$rt_num}&pageNo=10&startPage=10&numOfRows=1&pageSize=1&serviceKey=IoGcqdatXH1xSmopMvIleCtd7ZJELW2kJg9d2WvfZdbxvH1stcbh8Gvdui/iNUG28Wcq/uppkV0YZqU4Bd3BOA==&&_type=json"
      isBrand= JSON.load(open(url))
      puts isBrand
  
      if isBrand["response"]["body"]["totalCount"] == 0  #없음=nil 탈퇴=2
        @result = "확인할 수 없습니다. 챗봇으로 문의주세요!"
      elsif isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] == 1 #예시 124815
         @name= isBrand["response"]["body"]["items"]["item"]["wkplNm"]
         @result = @name+ ": 운영중"
      else
         @result = "탈퇴자입니다. 챗봇으로 문의주세요!"    
      end
    end

      
  # if isBrand["response"]["body"]["totalCount"] == 0
  # elsif isBrand["response"]["body"]["items"]["item"]["wkplJnngStcd"] == 1
      # redirect_to new_owner_registration_path
  # end    

end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
