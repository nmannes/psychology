# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def logout
    redirect_to '/'
  end
end
