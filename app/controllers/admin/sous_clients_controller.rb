class Admin::SousClientsController < ApplicationController
  before_action :authenticate_user!
  # before_action :authorize_admin!
   
  before_action :set_agent
  before_action :set_sous_client, only: %i[show edit update destroy]

  def new
    @sous_client = @agent.sous_clients.new
  end

  def create
    @sous_client = @agent.sous_clients.new(sous_client_params)
    if @sous_client.save
      redirect_to admin_client_agent_path(@agent.client, @agent), notice: 'Sous‑client ajouté avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @sous_client.update(sous_client_params)
      redirect_to admin_client_agent_path(@agent.client, @agent), notice: 'Sous‑client modifié.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sous_client.destroy
    redirect_to admin_client_agent_path(@agent.client, @agent), notice: 'Sous‑client supprimé.'
  end

  private

  def set_agent
    @agent = Agent.find(params[:agent_id])
  end

  def set_sous_client
    @sous_client = @agent.sous_clients.find(params[:id])
  end

  def sous_client_params
    params.require(:sous_client).permit(:nom, :prenom, :relation)
  end
end
#  def authorize_admin!
#            redirect_to root_path, alert: "Accès refusé" unless current_user&.admin?
#   end

