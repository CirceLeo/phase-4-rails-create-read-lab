class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
    end

    def show
        plant = Plant.find(params[:id])
        if plant
            render json: plant
        else
            render json: {error: "plant not found"}, status: :not_found            
        end
    end

    def create
        plant = Plant.create(params.permit(:name, :price, :image))
        render json: plant, status: :created
    end

end
