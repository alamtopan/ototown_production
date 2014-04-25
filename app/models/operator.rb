class Operator < ActiveRecord::Base
  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, 
                  :role_id, :provider, :uid, :oauth_token, :oauth_expires_at
  # Include default devise modules. Others available are:
  # :confirmable, and 
  devise :database_authenticatable, :lockable, :timeoutable, 
         :recoverable, :rememberable, :trackable, :validatable

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
