# == Schema Information
#
# Table name: members
#
#  id                     :bigint           not null, primary key
#  age                    :string
#  email                  :string           default(""), not null
#  employer               :string
#  encrypted_password     :string           default(""), not null
#  link                   :string
#  location               :string
#  name                   :string
#  profile                :text
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_members_on_email                 (email) UNIQUE
#  index_members_on_reset_password_token  (reset_password_token) UNIQUE
#
class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: %i[facebook github google_oauth2]

  mount_uploader :profile, ProfileUploader
  has_many :likes
  has_many :friends, class_name: "Member"
  has_many :comments
  has_and_belongs_to_many :friend_requests

  has_many :authorizations

  # omniauth facebook provider
  def self.from_omniauth(auth, current_member)
    # check for existing authorization
    # Find or create Authorization with: provider, uid, token and secret
    authorization =
      Authorization.where(
        provider: auth.provider,
        uid: auth.uid.to_s,
        token: auth.credentials.token,
        secret: auth.credentials.secret
      ).first_or_initialize

    if authorization.member.blank?
      member =
        (
          if current_member.nil?
            Member.where("email = ?", auth["info"]["email"]).first
          else
            current_member
          end
        )

      # save user related data in user table
      if member.blank?
        Member.new(
          email: auth.info.email,
          password: Devise.friendly_token[0, 10],
          name: auth.info.name,
          locations: auth.info.location,
          profile: auth.info.image
        )
        # since twitter don't provide email,
        # so you need to skip validation for twitter.
        auth.provider == "twitter" ? user.save!(validate: false) : user.save!
      end

      # store authorization related data in authorization table
      authorization.username = auth.info.nickname
      authorization.member_id = member.id
      authorization.save!
    end
    authorization.member
  end
end
