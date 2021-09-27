class SignupsController < ApplicationController

    def create
        signup = Signup.create(signup_params)
        # byebug
        if signup.valid?
            render json: signup, include: :activity, status: :created
        else
            render json: {errors: signup.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end


end
