class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :token, :name, :image
  # attr_accessible :title, :body
   #Association
  has_many :articles
  #thirdparty authentication
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20],
                         image:auth.info.image
                         )
  end
  user
end
 def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  data = access_token.info
	  if user = User.where(:email => data["email"]).first
		user
	  else
		User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :name => data["name"])
	  end
  end
end
