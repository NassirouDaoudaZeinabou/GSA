class Client < ApplicationRecord
     has_many :agents, dependent: :destroy
end
