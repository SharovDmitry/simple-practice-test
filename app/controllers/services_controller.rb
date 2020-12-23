# frozen_string_literal: true

class ServicesController < ApplicationController
  def index
    @services = ApiService::Service.new(options).get_all
    cache_services(@services['data'])
  end

  private

  def options
    { clinicianId: Rails.application.credentials.clinician_id }
  end

  def cache_services(services)
    return if services.blank?

    session[:services] = services
  end
end
