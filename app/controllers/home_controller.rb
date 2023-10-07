# frozen_string_literal: true

class HomeController < ApplicationController
  skip_after_action :verify_authorized, only: :index

  def index; end
end
