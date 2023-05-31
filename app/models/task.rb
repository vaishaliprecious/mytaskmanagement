# frozen_string_literal: true

class Task < ApplicationRecord
  validates :title, :description, presence: true
  belongs_to :user
  belongs_to :category
  validates :title, :description, presence: true
  validates :title, :description, length: { minimum: 5, message: '%<value>s Not enough length' }
  has_one_attached :image
  # CATEGORY = ['Electrical', 'market', 'Medical', 'Household', 'Teaching']

  after_create :send_create_mail
  def send_create_mail
    TaskMailer.new_mail(self).deliver_now
  end

  after_update :send_update_mail
  def send_update_mail
    TaskMailer.update_mail(self).deliver_now
  end
end
