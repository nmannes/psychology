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

    def stage
        return 'start' if data.blank?
    end

end
