 
class User < ActiveRecord::Base
  has_one :profile
  has_many :articles
  mount_uploader :profileimage, S3Uploader
  acts_as_follower
  acts_as_followable

  acts_as_reader #알림기능
  has_many :new_alarms #알림기능
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # GENDER_TYPES = [ ["male","0"], [ "female","1" ] ]
  # validates_inclusion_of :is_female, in: [true, false]
  
  def self.find_for_oauth(auth, signed_in_resource = nil)
    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    # user가 nil이라면 새로 만든다
    if user.nil?
      # 이미 있는 이메일인지 확인한다
      email = auth.info.email
      user = User.where(:email => email).first
      unless self.where(email: auth.info.email).exists?
        # 없다면 새로운 데이터를 생성한다
        if user.nil?
          # provider(회사)별로 데이터를 제공해주는 hash의 이름이 다름. omnaiuth별로 auth hash가 어떤 경로로, 이름으로 제공되는지 확인하고 설정해야ㅏㅁ.
          # 카카오는 email을 제공하지 않음 
            if auth.provider == "kakao"
              user = User.new(
                profileimage: auth.info.image,
                ## AWS S3와 연동할 때 프로필 이미지를 저장하기 위해 필요한 부분
                #remote_profileimage_url: auth.info.image.gsub('http://','https://'),
                name: auth.info.name,
                password: Devise.friendly_token[0,20]
              )
            else
              user = User.new(
                email: auth.info.email,
                name: auth.info.name,                
                gender: auth.extra.raw_info.gender,
                # is_female: auth.extra.raw_info.gender == "female" ? false : true,              
                profileimage: auth.info.image,
                #remote_profileimage_url: auth.info.image.gsub('http://','https://'),
                password: Devise.friendly_token[0,20]
              )
            end
          user.save!
        end #if
      end #unless
     Profile.create!(user_id: user.id)
    end #def
 
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
 
  # email이 없어도 가입이 되도록 설정
 
  def email_required?
    false
  end

  ## for current password문제
  #to remove the current password check if updating a profile originally gotten via oauth (fb, twitter)
  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
  end

  def update_without_password(params={})

    params.delete(:password)
    params.delete(:password_confirmation)
    result = update_attributes(params)
    clean_up_passwords
    result
  
  end

  def verify_password_and_update(params)
    #devises' update_with_password 
    # https://github.com/plataformatec/devise/blob/master/lib/devise/models/database_authenticatable.rb
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
      update_attributes(params)
    else
      self.attributes = params
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
  end

  before_save do
    self.allergy.gsub!(/[\[\]\"]/, '') if attribute_present?("allergy")
    # self.allergy = "#{allergy}, #{etc}"    
  end
  before_update do
    self.allergy = "#{allergy} #{etc}"    
  end  
end
