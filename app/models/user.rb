# frozen_string_literal: true

class User < ApplicationRecord
  validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/ }, if: :zip_code?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def zip_code?
    zip_code.present?
  end
end
