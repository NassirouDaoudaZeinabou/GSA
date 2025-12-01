class Admin::ClientsController < ApplicationController
    before_action :authenticate_user!
   #before_action :authorize_admin!
   
      before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients= Client.all.order(:nom)
    end
    def show
        @agents= @client.agents.order(:nom)
    end
        
       
    def new
        @client=Client.new
    end
    def create
        @client= Client.new(client_params)
        if @client.save
            redirect_to admin_clients_path , notice: "Client ajouté avec succès"
        else
            render :new

        end
    end
    def edit
    end
    def update
        if @client.update(client_params)
            redirect_to admin_clients_path , notice: "Client  modifié avec succès"
        else
            render :edit
        end

    end
    def destroy
         @client.destroy
        redirect_to admin_clients_path, notice: "Client supprimé avec succès."
            
    end



    private
    def client_params
        params.require(:client).permit(:nom, :adresse, :budget_total_alloue)
    end
    def set_client
        @client= Client.find(params[:id])
    end
    #  def authorize_admin!
    #        redirect_to root_path, alert: "Accès refusé" unless current_user&.admin?
    # end
end
