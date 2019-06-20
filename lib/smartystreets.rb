# -*- encoding: utf-8 -*-

require 'httparty'
require 'multi_json'
require 'thread'

require 'smartystreets/util'
require 'smartystreets/api_error'
require 'smartystreets/street_address_api'
require 'smartystreets/street_address_request'
require 'smartystreets/street_address_response'
require 'smartystreets/zipcode_api'
require 'smartystreets/zipcode_request'
require 'smartystreets/zipcode_response'
require 'smartystreets/version'

# Wrapper module for the SmartyStreets API.
#
# Covers both the Street Address and Zipcode APIs.<br>
# www.smartystreets.com
#
# @author Peter Edge (peter.edge@gmail.com)
module SmartyStreets
  class << self
    include Util
  end

  @@lock = Mutex.new

  def self.set_type_checking(type_checking)
    Util.set_type_checking(type_checking)
  end

  def self.type_checking?
    Util.type_checking?
  end

  # Set the authentication id and token from SmartyStreets.
  #
  # This method must be called exactly once.
  #
  # @param [String] auth_id the authentication id
  # @param [String] auth_token the authenticaton token
  # @return nil
  def self.set_auth(auth_id, auth_token)
    @@lock.synchronize do
      @@auth_id = check_type(auth_id, String)
      @@auth_token = check_type(auth_token, String)
      check_argument(!@@auth_id.empty?)
      check_argument(!@@auth_token.empty?)
      class << self
        remove_method :set_auth
      end
      nil
    end
  end

  def self.auth_id
    raise StandardError.new('set_auth must be called!') unless defined?(@@auth_id)
    @@auth_id
  end

  def self.auth_token
    raise StandardError.new('set_auth must be called!') unless defined?(@@auth_token)
    @@auth_token
  end

  # Set the API url.
  #
  # This method can only be called once, but is not required.
  #
  # @param [String] api_url the API url
  # @return nil
  def self.set_api_url(api_url)
    @@lock.synchronize do
      @@api_url = check_type(api_url, String)
      check_argument(!@@api_url.empty?)
      class << self
        remove_method :set_api_url
      end
      nil
    end
  end

  def self.api_url
    defined?(@@api_url) ? @@api_url : 'https://api.smartystreets.com'
  end
end
