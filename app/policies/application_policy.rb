# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  protected

  def logged_in?
    user.present?
  end
end
