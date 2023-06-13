# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :member
  belongs_to :category

  validates :title, :description, presence: true, length: { minimum: 5, message: '%<value>s Not enough length' }

  has_one_attached :image

  enum :approve, %i[not_approve approve]

  after_commit :send_create_mail

  def send_create_mail
    TaskMailer.update_mail(self).deliver_now if assigned_task.present? && previous_changes[:status].present?
    TaskMailerJob.set(wait_until: Date.tomorrow.noon).perform_later(self) unless assigned_task.present?
  end
end
