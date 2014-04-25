class User < Operator
  ROLE_ID = 2

  attr_accessible :email, :username, :password, :password_confirmation, :profile_attributes, :role_id,
                  :dealer_info_attributes, :images_attributes, :provider, :uid, :oauth_token, :oauth_expires_at

  devise :database_authenticatable, :lockable, :timeoutable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :products

  after_initialize :after_initialized

  has_many :images, foreign_key: 'dealer_id', class_name: 'ImageDealer', :dependent => :destroy
  has_one :profile, foreign_key: 'user_id', :dependent => :destroy
  has_one :dealer_info, foreign_key: 'dealer_id', :dependent => :destroy
  accepts_nested_attributes_for :profile, reject_if: :all_blank
  accepts_nested_attributes_for :dealer_info, reject_if: :all_blank
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  validates_uniqueness_of :username


  default_scope { where(role_id: ROLE_ID) }

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(username:auth.extra.raw_info.name,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                          )
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
