class Agent < ApplicationRecord
  belongs_to :client
       has_many :sous_clients, dependent: :destroy

end
