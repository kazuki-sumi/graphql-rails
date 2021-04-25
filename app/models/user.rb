class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :liks, dependent: :destroy

  enum role: [ :banned, :reader, :sub_admin, :admin ]
  validates :name, presence: true
end
