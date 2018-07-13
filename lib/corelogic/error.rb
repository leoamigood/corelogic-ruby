module Corelogic
  class Error < StandardError
    attr_reader :code

    BadRequest = Class.new(self)
    Unauthorized = Class.new(self)
    Forbidden = Class.new(self)
    NotFound = Class.new(self)
    InternalServerError = Class.new(self)

    ERRORS_MAP = {
      400 => Corelogic::Error::BadRequest,
      401 => Corelogic::Error::Unauthorized,
      403 => Corelogic::Error::Forbidden,
      404 => Corelogic::Error::NotFound,
      500 => Corelogic::Error::InternalServerError
    }.freeze

    private

    def self.from_response(body)
      message, status = parse_error(body)
      new(message, status)
    end

    def self.parse_error(body)
      message = body.fetch(:message, nil) || body.fetch(:fault, {}).fetch(:faultstring, nil)
      status = body.fetch(:status, nil) || body.fetch(:fault, {}).fetch(:detail, {}).fetch(:errorcode, nil)
      return message, status
    end

    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end
  end
end