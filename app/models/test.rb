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
    
    if test_type == 'fluency'
      stages.find do |s|
          ts_key = "#{s}_start_ts"
          s if !data.key?(ts_key) ||  Time.now - data[ts_key].to_time < 1.minute
      end
    elsif test_type == 'auditory'
      es = data['ended_stages']
      return stages.first if es.nil?
      stages.find do |s|
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
    (1..4).each do |n|
      h[n.to_s] = 'Some words will be read to you. Please list back as many as you can, in any order'
    end

    (5..6).each do |n|
      h[n.to_s] = 'Some words [the blue list] will be read to you. Please list back as many as you can, in any order'
    end

    h['7'] = 'Yes or no, was the user asked about this word five times?'
    h['8'] = 'Which of the words was in the group that was asked about five times?'    
    
    h[current_stage]
  end

  def stages
    if test_type == 'fluency' 
      [variant || 'animal', 'f','s']
    elsif test_type == 'auditory'
      (1..8).map(&:to_s)
    end
  end


  def current_stage_number
    (stages.index(current_stage) || 0) + 1
  end

  def num_stages
    stages.count
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

  def delete_word(stage, word, index)
    if index 
      data[stage].delete_at(index.to_i)
    else
      data[stage].delete(word)
    end
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

  def stage7_list
    (1..10).map(&:to_s) # tbd
  end

  def stage_7_curr_word
    stage7_list[data['7']&.count || 0]
  end

  def stage8_list_1
    (1..10).map(&:to_s) # tbd
  end

  def stage8_list_2
    (101..110).map(&:to_s) # tbd
  end

  def stage8_curr_index
    current_stage == '8' && data['8']&.count || 0
  end

  def stage8_curr_choices
    return nil if current_stage != '8' ||
      stage8_list_1[stage8_curr_index].nil? 
    [
      stage8_list_1[stage8_curr_index],
      stage8_list_2[stage8_curr_index],
      'Neither'
    ]
  end

end
