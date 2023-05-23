class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :category
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
