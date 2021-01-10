# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::OfficesController, type: :controller do
  describe 'GET index' do
    context 'with services cache' do
      before(:each) do
        VCR.use_cassette('offices_request') { get :index, params: { service_id: 6 } }
      end

      it 'should be success' do
        expect(response).to have_http_status(:success)
      end

      it 'fetches offices from API' do
        result = JSON.parse(response.body)['data']
        expect(result.size).to eq 3
        expect(result.sample.keys).to match_array(%w[id type links attributes])
      end
    end
  end
end
