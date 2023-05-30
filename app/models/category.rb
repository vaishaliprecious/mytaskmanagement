class Category <ApplicationRecord
    has_many :tasks
    validates :category_name, uniqueness: true
end
