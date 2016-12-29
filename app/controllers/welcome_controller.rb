class WelcomeController < ApplicationController

  def index
    flash[:notice] = "yayay"
  end
end
