class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :ratings,  as: :rateable
  has_many :messages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      name = auth.extra.raw_info.name if auth.provider == 'facebook'
      name = auth.info.nickname if auth.provider == 'twitter'
      image = auth.info.image
      user = User.create(
        name:     name,
        image:    image,
        uid:      auth.uid,
        email:    dummy_email(auth),
        provider: auth.provider,
        password: Devise.friendly_token[0, 20]
      )
    end

    if user.image.empty?
      user.image = "/images/default_profile_normal.png"
    end

    user
  end

  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
