class User < ActiveRecord::Base
  has_many :lists
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :username, :name, presence: true
  validates :username, uniqueness: true
  validates :username, format: { with: %r{^\S*$} }
end
