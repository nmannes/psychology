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

    @education_levels = [
        'No schooling completed', 
        'Nursery school to 8th grade', 
        'Some high school, no diploma',
        'High school graduate, diploma or GED', 
        'Some college credit, no degree',
        'Trade/technical/vocational training',
        'Associate degree', 
        'Bachelor’s degree', 
        'Master\'s degree', 
        'Professional degree', 
        'Doctorate degree'
    ]
    return if @title

    redirect_to '/lab' and return
  end

  def demographics
    new_test = ::Test.new(
      test_type: params.require(:key),
      age: params.require(:age),
      gender: params.require(:gender),
      user_id: current_user.id,
      stages: get_stages(params.require(:key), params[:variant]),
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

    @test.delete_word(params.require(:stage), params.require(:word))

    render @test.template
  end


  def next_stage
    @test = Test.find_by(id: params[:id].to_i, user_id: current_user.id)
    redirect_to '/lab' and return unless @test

    @test.next_stage(params.require(:current_stage))

    render @test.template
  end

  private

  def get_stages(test_type, input)
    if test_type == 'fluency' 
      [input || 'animal', 'f','s']
    elsif test_type == 'memory'
      (1..8).map(&:to_s)
    end
  end

  def get_data(test_type)
    if test_type == 'memory'
      { 
        :w1 => %w[drum curtain bell coffee school parent moon garden hat farmer nose turkey color house river],
        :w2 => %w[desk ranger bird shoe stove mountain glasses towel cloud boat lamb gun pencil church fish] 
      }
    else
      {}
    end
  end
end
