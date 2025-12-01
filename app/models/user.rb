class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # Remplacement pour éviter conflit avec une éventuelle méthode enum custom (erreur wrong number of arguments)
  enum :role, { super_admin: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?

 # Callback pour définir un rôle par défaut
  before_create :set_default_role

  private

  def set_default_role
    self.role ||= :admin  # ou :user, :super_admin, selon ce que tu veux
  end

end
