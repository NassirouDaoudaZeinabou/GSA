class InscriptionController < ApplicationController
	# Public page to allow adding clients without authentication
	def index
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			redirect_to inscription_thanks_path
		else
			render :index, status: :unprocessable_entity
		end
	end

	def thanks
	end

	private

	def client_params
		params.require(:client).permit(:nom, :adresse, :budget_total_alloue)
	end
end
