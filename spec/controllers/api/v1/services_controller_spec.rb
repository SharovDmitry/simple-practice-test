# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::ServicesController, type: :controller do
  describe 'GET index' do
    before(:each) do
      VCR.use_cassette('services_request') { get :index }
    end

    it 'should be success' do
      expect(response).to have_http_status(:success)
      # expect(response).to render_template(:index)
    end

    it 'fetches services from API' do
      result = JSON.parse(response.body)['data']
      expect(result.size).to eq 4
      expect(result.sample.keys).to match_array(%w[id type links attributes])
    end
  end
end
