class Bee < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :hive_memberships
  has_many :hives, through: :hive_memberships
  has_many :combs, inverse_of: :author, foreign_key: :author_id

  validates :email, :password, :password, :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :name, length: { in: 2..250 }
  validates :password, length: { minimum: 8 }
end
