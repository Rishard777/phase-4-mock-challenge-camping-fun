class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
# rescue_from AcitveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    def create
        cm = Camper.create(camper_params)
        render json: cm, status: :created
    end

    private
    def record_not_found_response
        render json: {error: "Camper not found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    # def render_unprocessable_entity_response(exception)
    #     render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    # end
end
