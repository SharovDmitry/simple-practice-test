# frozen_string_literal: true

module ApiService
  class Service < ApiService::Base
    def get_all
      response = self.class.get('/cpt-codes', @options)
      parse(response)
    end
  end
end
