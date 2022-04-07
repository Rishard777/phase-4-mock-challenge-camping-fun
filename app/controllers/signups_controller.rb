class SignupsController < ApplicationController

  def create 
    signup = Signup.create(signup_params)
    if signup.id
      render json: signup.activity, status: :created
    else 
      render json: { errors: ["validation errors"] }, status: 422
      # render json: { errors: signup.errors.full_messages }
    end 
  end

  private 
    def signup_params
      params.permit(:camper_id, :activity_id, :time)
    end 

end