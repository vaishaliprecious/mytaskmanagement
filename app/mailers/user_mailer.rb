# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    mail(to: AdminUser.pluck(:email), subject: 'New user register to taskmanagement')
  end
end
