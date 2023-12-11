class Client < ApplicationRecord
  belongs_to :user
  has_many :test

  def url
    "/clients/#{id}"
  end
end
