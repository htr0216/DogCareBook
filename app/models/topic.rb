# == Schema Information
#
# Table name: topics
#
#  id          :bigint           not null, primary key
#  user_id     :integer
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#
class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: "user"
  has_many :comments
  has_many :comment_users, through: :comments, source: "user"
  
  mount_uploader :image, ImageUploader
end
