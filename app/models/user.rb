# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :member
  has_many :tasks ,dependent: :destroy

  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :email, :firstname, :lastname, presence: true
  validates :password, length: { in: 6..20 }

  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
  end
end
  

