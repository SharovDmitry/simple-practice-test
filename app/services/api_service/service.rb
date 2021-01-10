# frozen_string_literal: true

module ApiService
  class Service < ApiService::Base
    def get_all
      self.class.get('/cpt-codes', @options)
    end
  end
end
