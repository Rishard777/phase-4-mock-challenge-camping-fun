class CampersController < ApplicationController

    def index
        render json: Camper.all
    end
end
