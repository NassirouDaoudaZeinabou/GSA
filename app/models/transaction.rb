class Transaction < ApplicationRecord
  belongs_to :agent
  belongs_to :sous_client
  belongs_to :etablissement
end
