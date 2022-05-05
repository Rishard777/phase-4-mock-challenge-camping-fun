class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    private
    def record_not_found_response
        render json: {error: "Camper not found"}, status: :not_found
    end
end
