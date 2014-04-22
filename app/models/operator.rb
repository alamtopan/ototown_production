class Operator < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, :role_id
  # Include default devise modules. Others available are:
  # :confirmable, and 
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable


  class << self
    def find_for_facebook_oauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.username = auth.info.nickname
      end
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

  end

  def not_dealer?
    self.dealer_info.active.nil?
  end

  def request_dealer?
    self.dealer_info.active == false
  end

  protected
    def after_initialized
      self.profile = Profile.new if self.profile.blank?
      self.dealer_info = DealerInfo.new if self.dealer_info.blank?
    end
end
