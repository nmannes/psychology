# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!

  TESTS = {
    'fluency' => 'Benton Verbal Fluency Test',
    'memory' => 'Rey Auditory Verbal Learning Test',
    'trail' => 'Trail Making Test'
  }.freeze

  def show
    @test_types = [
      {
        name: 'Benton Verbal Fluency Test',
        url: '/lab/begin?key=fluency'
      },
      {
        name: 'Rey Auditory Verbal Learning Test',
        url: '/lab/begin?key=memory'
      },
      {
        name: 'Trail Making Test',
        url: '/lab/begin?key=trail'
      }
    ]
  end

  def begin
    @test = params.require(:key)
    @title = TESTS[@test]

    @education_levels = ['No schooling completed', 'Nursery school to 8th grade', 'Some high school, no diploma',
                         'High school graduate, diploma or the equivalent (for example: GED)', 'Some college credit, no degree', 'Trade/technical/vocational training',
                         'Associate degree', 'Bachelor’s degree', 'Master\'s degree', 'Professional degree', 'Doctorate degree']
    return if @title

    redirect_to '/lab' and return
  end

  def demographics
    new_test = ::Test.new(
      test_type: params.require(:key),
      age: params.require(:age),
      gender: params.require(:gender),
      user_id: current_user.id,
      data: {}
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

    stage = params.require(:stage)

    @test.data["#{stage}_start_ts"] ||= Time.now

    if params[:word].present?
      @test.data[stage] ||= []
      @test.data[stage] << params.require(:word).downcase
      @test.data[stage] = @test.data[stage].uniq
    end

    @test.save!
    render 'tests/_fluency_test'
  end

  def delete_entry
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    redirect_to '/lab' and return unless @test

    @test.data[params.require(:stage)].delete(params.require(:word))
    @test.save!

    render 'tests/_fluency_test'
  end
end
