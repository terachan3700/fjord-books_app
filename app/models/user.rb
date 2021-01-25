# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  validates :provider, uniqueness: { scope: :uid, if: -> { provider.present? } }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.provider = auth[:provider]
      user.uid = auth[:uid]
    end
  end

  def update_with_password(params, *options)
    # OAuth認証のユーザーでパスワード以外の変更は現在のパスワードを不要とする
    if provider.present? && params[:password].blank?
      params.delete(:current_password)
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?

      update(params, *options)
    else
      super
    end
  end
end
