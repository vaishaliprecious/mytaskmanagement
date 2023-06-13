# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :member
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :email, :firstname, :lastname, presence: true
  validates :password, length: { in: 6..20 }

  
  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
  end


  end
  

