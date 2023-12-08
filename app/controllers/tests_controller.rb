# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!


  def show
    @test_types = Constants::OFFERED_TESTS
  end

  def list
    @tests = Test.where(user_id: current_user.id)

  end

  def begin
    @test = params.require(:key)
    @title = Constants::TESTS[@test]

    @education_levels = Constants::EDUCATION_LEVELS
    return if @title

    redirect_to '/lab' and return
  end

  def demographics
    new_test = ::Test.new(
      test_type: params.require(:key),
      age: params.require(:age),
      gender: params.require(:gender),
      user_id: current_user.id,
      variant: params[:variant],
      data: get_data(params.require(:key))
    )
    new_test.save!
    redirect_to new_test.url and return
  end

  def conduct
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    return if @test

    redirect_to '/lab' and return
  end

  def add_word
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    redirect_to '/lab' and return unless @test
    @test.add_word(params.require(:stage), params[:word])
    
    render @test.template
  end

  def delete_entry
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    redirect_to '/lab' and return unless @test

    @test.delete_word(params.require(:stage), params.require(:word), params[:index])

    render @test.template
  end


  def next_stage
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    redirect_to '/lab' and return unless @test

    @test.next_stage(params.require(:current_stage))
    render @test.template
  end


  def stage7
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    redirect_to '/lab' and return unless @test
  end

  private

  def get_data(test_type)
   {}
  end
end