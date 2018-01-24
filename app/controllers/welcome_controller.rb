class WelcomeController < ApplicationController
  def index
    flash[:warning] = "Warning!"
  end
end
