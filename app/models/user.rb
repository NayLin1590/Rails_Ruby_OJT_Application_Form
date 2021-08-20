class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true , length: { maximum: 50}
end
