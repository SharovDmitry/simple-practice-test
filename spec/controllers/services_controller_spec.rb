# frozen_string_literal: true

require 'rails_helper'

describe ServicesController, type: :controller do
  describe 'GET index' do
    before(:each) do
      VCR.use_cassette('services_request') { get :index }
    end

    it 'should be success' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'fetches services from API' do
      expect(assigns(:services)).to be_a(Hash)
      expect(assigns(:services)['data'].count).to eq(4)
    end

    it 'caches API response' do
      expect(session[:services]).not_to be_nil
      expect(session[:services]).to eq(assigns(:services)['data'])
    end
  end
end
