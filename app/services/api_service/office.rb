# frozen_string_literal: true

module ApiService
  class Office < ApiService::Base
    def get_all
      response = self.class.get('/offices', @options)
      parse(response)
    end
  end
end
