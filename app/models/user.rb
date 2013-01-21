class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :rememberable, :trackable, :validatable, :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :tasks, dependent: :destroy
  
  before_save :ensure_authentication_token
end
