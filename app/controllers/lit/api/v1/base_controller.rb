module Lit
  module Api
    module V1
      class BaseController < ActionController::Base
        layout nil
        respond_to :json
        before_action :authenticate_requests!

        private

        def authenticate_requests!
          authenticate_or_request_with_http_token do |token, _options|
            Lit.api_key == token
          end
        end
      end
    end
  end
end
