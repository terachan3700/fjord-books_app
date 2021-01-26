# frozen_string_literal: true

class User < ApplicationRecord
  validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/ }, if: -> { zip_code.present? }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
