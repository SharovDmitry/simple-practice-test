# frozen_string_literal: true

module ApiService
  class Office < ApiService::Base
    def get_all
      self.class.get('/offices', @options)
    end
  end
end
