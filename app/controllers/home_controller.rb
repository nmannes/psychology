# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user
      redirect_to '/lab'
    end
  end

  def logout
    redirect_to '/'
  end
end
