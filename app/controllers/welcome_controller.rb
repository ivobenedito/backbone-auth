class WelcomeController < ApplicationController
  before_filter :authenticate_user!, only: :protected

  def index; end

  def protected; end
end