# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  image_name      :string(255)
#  sex             :string(255)
#  nickname        :string(255)
#  birth_date      :date
#
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true,  format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, on: :create, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, length: { maximum: 50 }

  has_secure_password

  mount_uploader :image_name, ImageUploader

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: "topic"
  has_many :comments
  has_many :comment_topics, through: :comments, source: "topic"
  has_many :events
end
