class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bakery

  after_create :update_access_token!

  def update_access_token!
    access_token = "#{self.id}:#{Devise.friendly_token}"
    save!
  end
end
