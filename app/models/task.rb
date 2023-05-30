class Task < ApplicationRecord
    validates :title,:description ,presence:true 
    belongs_to :user
    belongs_to :category
    validates :title,:description ,presence:true 
    validates :title,:description, length: { minimum: 5, message: "%{value} Not enough length"}
    has_one_attached:image
   # CATEGORY = ['Electrical', 'market', 'Medical', 'Household', 'Teaching']
   
   after_save :send_save_mail
   def send_save_mail
    TaskMailer.new_mail(self).deliver_now
   end
end

