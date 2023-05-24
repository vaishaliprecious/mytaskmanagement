class User < ApplicationRecord
  has_many :tasks, inverse_of: 'user'
  has_many_attached:image 


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email,:firstname,:lastname, presence: true
  after_create :send_welcome_mail
   def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
   end
end
