module Api
  module V1
    class PetsController < ApplicationController
      def create
        pet = PetRepository.create(pet_params)
        render json: pet, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
      end

      def out_of_zone_summary
        summary = PetRepository.out_of_zone_summary
        render json: summary
      end

      private

      def pet_params
        params.require(:pet).permit(:pet_type, :tracker_type, :owner_id, :in_zone, :lost_tracker)
      end
    end
  end
end