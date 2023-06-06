# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, :description,  presence: true,length: { minimum: 5, message: '%<value>s Not enough length' }
  
  has_one_attached :image

  enum :approve, %i[not_approve approve]
  
  after_commit :send_create_mail
  
  def send_create_mail
    TaskMailer.update_mail(self).deliver_now if self.assigned_task.present? && self.previous_changes[:status].present?
    TaskMailerJob.set(wait_untill:Time.now+30.second).perform_later(self) unless self.assigned_task.present?
  end
end
