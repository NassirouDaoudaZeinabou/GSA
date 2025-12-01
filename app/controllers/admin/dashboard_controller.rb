class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
  # before_action :authorize_admin!
   
   
    def index
        @clients_count        = Client.count
        @agents_count         = Agent.count
        @sous_clients_count   = SousClient.count
        @etabs_count          = Etablissement.count
        @transactions_count   = Transaction.count

        @total_budget_clients = Client.sum(:budget_total_alloue)
        @total_depenses       = Transaction.sum(:montant)
        @recent_transactions  = Transaction.order(created_at: :desc).limit(5)
    end
    #  def authorize_admin!
    #        redirect_to root_path, alert: "Accès refusé" unless current_user&.admin?
    # end
end
