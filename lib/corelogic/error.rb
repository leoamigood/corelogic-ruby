# frozen_string_literal: true

module Corelogic
  class Error < StandardError
    attr_reader :code

    BadRequest = Class.new(self)
    Unauthorized = Class.new(self)
    Forbidden = Class.new(self)
    NotFound = Class.new(self)
    InternalServerError = Class.new(self)
    TooManyRequests = Class.new(self)

    ERRORS_MAP = {
      400 => Corelogic::Error::BadRequest,
      401 => Corelogic::Error::Unauthorized,
      403 => Corelogic::Error::Forbidden,
      404 => Corelogic::Error::NotFound,
      429 => Corelogic::Error::TooManyRequests,
      500 => Corelogic::Error::InternalServerError
    }.freeze

    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end

    class << self
      def from_response(body)
        message, status = parse_error(body)
        new(message, status)
      end

      private

      def parse_error(body)
        message = body.fetch(:message, nil) || body.fetch(:fault, {}).fetch(:faultstring, nil)
        status = body.fetch(:status, nil) || body.fetch(:fault, {}).fetch(:detail, {}).fetch(:errorcode, nil)
        [message, status]
      end
    end
  end
end
