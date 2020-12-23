# frozen_string_literal: true

class OfficesController < ApplicationController
  before_action :verify_cache

  def index
    @service = service_from_cache
    @offices = ApiService::Office.new(options).get_all
  end

  private

  def options
    {
      clinicianId: Rails.application.credentials.clinician_id,
      cptCodeId: params[:service_id]
    }
  end

  def service_from_cache
    session[:services].find { |service| service['id'] == params[:service_id] }
  end

  def verify_cache
    redirect_to services_path if session[:services].blank?
  end
end
