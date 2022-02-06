class User < ApplicationRecord
  has_many :contacts, foreign_key: :created_by

  validates_presence_of :username, :email, :password
end
