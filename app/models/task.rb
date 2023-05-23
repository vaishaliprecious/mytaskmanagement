class Task < ApplicationRecord
    validates :title,:description ,presence:true 
    belongs_to :user
    belongs_to :category
    CATEGORY= ["HOME","Office","Market"]
end
