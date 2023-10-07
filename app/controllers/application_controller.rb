# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = I18n.t('not_authorized')
    redirect_back(fallback_location: root_path)
  end
end
