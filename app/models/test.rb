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

  def current_stage
    JSON.parse(stages).find do |s|
        ts_key = "#{s}_start_ts"
        s if !data.key?(ts_key) || (test_type == 'fluency' && Time.now - data[ts_key].to_time < 1.minute)
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
      'supermarket' => 'List as many supermarket-related words as you can',
      'f' => 'List as many words beginning with the letter \'F\' as you can',
      's' => 'List as many words beginning with the letter \'S\' as you can',
      '1' => 'A few words will be read to you. Please name as many back as you can, in any order'
    }[current_stage]
  end


  def add_word(stage, word)
    data["#{stage}_start_ts"] ||= Time.now
    if word.present?
      data[stage] ||= []
      data[stage] << word.downcase
      if test_type == 'fluency'
        data[stage] = data[stage].uniq
      end
      save!
    end
  end

  def delete_word(stage, word)
    data[stage].delete(word)
    save!
  end

  def template
    "tests/_#{test_type}_test"
  end

  def current_list
    data[current_stage]
  end
end
