# frozen_string_literal: true

module ApiService
  class Base
    include HTTParty
    base_uri Rails.application.credentials.portal_url

    def initialize(query)
      @options = {
        headers: headers,
        query: { filter: query }
      }
    end

    private

    def headers
      {
        'accept' => 'application/vnd.api+json',
        'api-version' => '2019-01-17',
        'application-build-version' => '0.0.0',
        'application-platform' => 'web'
      }
    end

    def parse(response)
      JSON.parse(response.body)
    end
  end
end
