# frozen_string_literal: true

module Api
  module V1
    class ServicesController < ApplicationController
      def index
        response = ApiService::Service.new(options).get_all

        render json: response.body, status: response.code
      end

      private

      def options
        { clinicianId: Rails.application.credentials.clinician_id }
      end
    end
  end
end
