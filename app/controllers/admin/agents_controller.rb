class Admin::AgentsController < ApplicationController
   before_action :authenticate_user!
   before_action :authorize_admin!
    before_action :set_client, only: %i[new create]
    before_action :set_agent, only: %i[show edit update destroy]

    def new
        @agent = (@client.present? ? @client.agents.new : Agent.new)
    end

    def create
        @agent = (@client.present? ? @client.agents.new(agent_params) : Agent.new(agent_params))
        if @agent.save
            redirect_to admin_client_path(@agent.client), notice: 'Agent ajouté avec succès.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
    end

    def edit
          @client = Client.find(params[:client_id])
          @agent  = @client.agents.find(params[:id])
    end

    def update
        if @agent.update(agent_params)
            redirect_to admin_client_path(@agent.client), notice: 'Agent modifié avec succès.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        client = @agent.client
        @agent.destroy
        redirect_to admin_client_path(client), notice: 'Agent supprimé.'
    end

    private

    def set_client
        @client = Client.find_by(id: params[:client_id]) if params[:client_id].present?
    end

    def set_agent
        @agent = Agent.find(params[:id])
    end

    def agent_params
        params.require(:agent).permit(:nom, :prenom, :matricule, :budget_sante, :client_id)
    end
     def authorize_admin!
           redirect_to root_path, alert: "Accès refusé" unless current_user&.admin?
    end
end
