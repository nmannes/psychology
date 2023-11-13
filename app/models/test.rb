# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_type  :string
#  age        :integer
#  gender     :string
#  data       :json
#  user_id    :integer          not null
#
class Test < ApplicationRecord
  def url
    "/lab/test/#{id}"
  end

  def stages
    case test_type
    when 'fluency'
      %w[animal f s]
    else
      ['unimplemented']
    end
  end

  def current_stage
    stages.find do |s|
      ts_key = "#{s}_start_ts"
      s if !data.key?(ts_key) || Time.now - Time.new(data[ts_key]) < 1.minute
    end
  end

  def completed?
    current_stage.nil?
  end

  def curr_stage_start_time
    data["#{current_stage}_start_ts"]
  end

  def instructions
    {
      'animal' => 'List as many animals as you can',
      'f' => 'List as many words beginning with the letter \'F\' as you can',
      's' => 'List as many words beginning with the letter \'S\' as you can'
    }[current_stage]
  end

  def current_list
    data[current_stage] || []
  end
end
