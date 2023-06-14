# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status, default: 'In_complete'
      t.string :category
      t.belongs_to :member
      t.belongs_to :category
      

      t.timestamps
    end
  end
end
