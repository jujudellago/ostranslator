class Account < ApplicationRecord
  belongs_to :user
  validates :name, :api_key, :api_secret, presence: true
  attr_encrypted_options.merge!(:encode => true)
  attr_encrypted :api_key, :key => ENV["keykey"]
  attr_encrypted :api_secret, :key => ENV["keysecret"]
  has_many :actions

end
