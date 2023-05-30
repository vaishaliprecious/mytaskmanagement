class User < ApplicationRecord
  has_many :tasks, inverse_of: 'user'
  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :trackable
  validates :email,:firstname,:lastname, presence: true
  validates :email, format: { with:  /\A(.+)@(.+)\z/ ,
       message: "only allows letters" }
  validates :password, length: { in: 6..20 }
  validates :password, numericality: true
  enum :user_type, { admin: 0, user: 1}

   
  after_create :send_welcome_mail
   def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
   end
end
