# frozen_string_literal: true

class RemoveCategoryFromtasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :category, :string
  end
end
