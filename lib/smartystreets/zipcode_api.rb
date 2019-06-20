# -*- encoding: utf-8 -*-

module SmartyStreets
  
  # Exposes calls to the SmartyStreets Zipcode API.
  #
  # @author Peter Edge (peter.edge@gmail.com)
  class ZipcodeApi
    class << self
      include Util
    end

    private_class_method :new

    def self.call(*zipcode_requests)
      check_array_element_types(zipcode_requests, ZipcodeRequest)
      zipcode_responses(HTTParty.post(request_url, request(*zipcode_requests)))
    end

    private

    def self.request(*zipcode_requests)
      {
        :query => query,
        :body => body(*zipcode_requests),
        :headers => headers
      }
    end

    def self.request_url
      SmartyStreets.api_url + '/zipcode'
    end

    def self.query
      {
        'auth-id' => SmartyStreets.auth_id,
        'auth-token' => SmartyStreets.auth_token
      }
    end

    def self.body(*zipcode_requests)
      MultiJson.dump(zipcode_requests)
    end

    def self.headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end

    def self.zipcode_responses(response)
      raise ApiError.from_code(response.code) unless response.code == 200
      MultiJson.load(response.body, :symbolize_keys => true).map do |response_element|
        ZipcodeResponse.new(response_element)
      end
    end
  end
end
