# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @test_types = ::Constants::OFFERED_TESTS
    if current_user
      redirect_to '/lab'
    end
  end

  def info
    redirect_to '/' and return unless ::Constants::TESTS[params[:id]]
    @test_types = ::Constants::OFFERED_TESTS
  end

  def logout
    redirect_to '/'
  end
end
