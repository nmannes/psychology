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
    parsed_stages = JSON.parse(stages)
    
    if test_type == 'fluency'
      parsed_stages.find do |s|
          ts_key = "#{s}_start_ts"
          s if !data.key?(ts_key) ||  Time.now - data[ts_key].to_time < 1.minute
      end
    elsif test_type == 'memory'
      es = data['ended_stages']
      return parsed_stages.first if es.nil?
      parsed_stages.find do |s|
        !es.include?(s)
      end || 'completed'
    end
  end

  def completed?
    current_stage.nil? || current_stage == 'completed'
  end

  def curr_stage_start_time
    data["#{current_stage}_start_ts"]
  end

  def instructions
    h = {
      'animal' => 'List as many animals as you can',
      'supermarket' => 'List as many supermarket-related words as you can',
      'f' => 'List as many words beginning with the letter \'F\' as you can',
      's' => 'List as many words beginning with the letter \'S\' as you can',
    }
    (1..8).each do |n|
      h[n.to_s] = 'Some words [the blue list] will be read to you. Please list back as many as you can, in any order'
    end
    
    h[current_stage]
  end


  def current_stage_number
    (JSON.parse(stages).index(current_stage) || 0) + 1
  end

  def num_stages
    JSON.parse(stages).count
  end

  def add_word(stage, word)
    if test_type == 'fluency'
      data["#{stage}_start_ts"] ||= Time.now
    end
    if word.present?
      data[stage] ||= []
      data[stage] << word.downcase
      if test_type == 'fluency'
        data[stage] = data[stage].uniq
      end
      save!
    end
  end

  def next_stage(stage)
    data['ended_stages'] ||= []
    data['ended_stages'] << stage
    save!
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

  def primary_words
    if current_stage == '5'
      w2
    else
      w1
    end
  end

  def secondary_words 
    return if current_stage < '5'
    if current_stage == '5'
      w1
    else
      w2
    end
  end

  def w1
    %w[drum curtain bell coffee school parent moon garden hat farmer nose turkey color house river]
  end

  def w2
    %w[desk ranger bird shoe stove mountain glasses towel cloud boat lamb gun pencil church fish] 
  end
end
