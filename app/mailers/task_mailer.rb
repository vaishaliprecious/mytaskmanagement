# frozen_string_literal: true

class TaskMailer < ApplicationMailer
  def new_mail(task)
    @task = task
    mail(to: AdminUser.pluck(:email), subject: 'New task created in taskmanagement')
  end

  def update_mail(task)
    @task = task
    mail(to: AdminUser.pluck(:email), subject: 'task is completed in taskmanagement')
  end
end
