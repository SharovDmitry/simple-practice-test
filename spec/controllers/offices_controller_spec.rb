# frozen_string_literal: true

require 'rails_helper'

describe OfficesController, type: :controller do
  describe 'GET index' do
    context 'with services cache' do
      before(:each) do
        session[:services] = [{ id: '6', attributes: { name: 'Service name' } }.with_indifferent_access]
        VCR.use_cassette('offices_request') { get :index, params: { service_id: 6 } }
      end

      it 'should be success' do
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:index)
      end

      it 'fetches offices from API' do
        expect(assigns(:offices)).to be_a(Hash)
        expect(assigns(:offices)['data'].count).to eq(3)
      end

      it 'retrieves service from cache' do
        expect(assigns(:service)).to be_a(Hash)
        expect(assigns(:service)[:attributes][:name]).to eq('Service name')
      end
    end

    context 'with empty services cache' do
      it 'redirects back if services cache empty' do
        VCR.use_cassette('offices_request') do
          get :index, params: { service_id: 6 }
          expect(response).to have_http_status(:redirect)
        end
      end
    end
  end
end
