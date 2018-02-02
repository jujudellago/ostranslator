class Action < ApplicationRecord
  belongs_to :account
  store_accessor :response, :status, :message, :uuid
  

end
