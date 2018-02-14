# -*- encoding: utf-8 -*-

module SmartyStreets

  # Wraps errors returned from the SmartyStreets API.
  #
  # @author Peter Edge (peter.edge@gmail.com)
  class ApiError < StandardError
    class << self
      include Util
    end

    BAD_INPUT = 400
    UNAUTHORIZED = 401
    PAYMENT_REQUIRED = 402
    INTERNAL_SERVER_ERROR = 500


    def self.from_code(code)
      check_type(code, Integer)
      case code
      when BAD_INPUT then new(code, 'Bad input. Required Fields missing from input, are malformed, or are too numerous.')
      when UNAUTHORIZED then new(code, 'Unauthorized. Authentication failure; invalid credentials')
      when PAYMENT_REQUIRED then new(code, 'Payment required. No active subscription found.')
      when INTERNAL_SERVER_ERROR then new(code, 'Internal server error. General service failure; retry request')
      else raise ArgumentError.new("Unknown response code: #{code}")
      end
    end

    private_class_method :new

    attr_reader :code

    def initialize(code, message)
      super(message)
      @code = code
    end
  end
end
