require 'corelogic/error'
require 'corelogic/utils'

module Corelogic
  class ResponseParser
    class << self
      def perform(response)
        response_body = response.body.blank? ? '' : Corelogic::Utils.deep_symbolize_keys(JSON.parse(response.body))
        error_filter(response.code, response_body)
      end

    private

      def error(code, body)
        klass = Corelogic::Error::ERRORS_MAP[code.to_i]
        klass&.from_response(body)
      end

      def error_filter(code, body)
        error = error(code, body)
        raise(error) if error

        body
      end
    end
  end
end

