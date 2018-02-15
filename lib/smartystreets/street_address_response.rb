# -*- encoding: utf-8 -*-

require 'smartystreets/base_json_object'

module SmartyStreets

  # Represents a response for a street address.
  #
  # @author Peter Edge (peter.edge@gmail.com)
  class StreetAddressResponse < BaseJsonObject

    attr_reader :input_id
    attr_reader :input_index
    attr_reader :candidate_index
    attr_reader :addressee
    attr_reader :delivery_line_1
    attr_reader :delivery_line_2
    attr_reader :last_line
    attr_reader :delivery_point_barcode
    attr_reader :components
    attr_reader :metadata
    attr_reader :analysis

    def initialize(hash)
      super(hash)
      @input_id = get_optional_string(hash, :input_id)
      @input_index = get_optional_fixnum(hash, :input_index)
      @candidate_index = get_optional_fixnum(hash, :candidate_index)
      @addressee = get_optional_string(hash, :addressee)
      @delivery_line_1 = get_optional_string(hash, :delivery_line_1)
      @delivery_line_2 = get_optional_string(hash, :delivery_line_2)
      @last_line = get_optional_string(hash, :last_line)
      @delivery_point_barcode = get_optional_string(hash, :delivery_point_barcode)

      components = get_optional_hash(hash, :components)
      metadata = get_optional_hash(hash, :metadata)
      analysis = get_optional_hash(hash, :analysis)
      @components = Components.new(components) if components
      @metadata = Metadata.new(metadata) if metadata
      @analysis = Analysis.new(analysis) if analysis
    end

    class Components < BaseJsonObject

      attr_reader :urbanization
      attr_reader :primary_number
      attr_reader :street_name
      attr_reader :street_predirection
      attr_reader :street_postdirection
      attr_reader :street_suffix
      attr_reader :secondary_number
      attr_reader :secondary_designator
      attr_reader :extra_secondary_number
      attr_reader :extra_secondary_designator
      attr_reader :pmb_designator
      attr_reader :pmb_number
      attr_reader :city_name
      attr_reader :default_city_name
      attr_reader :state_abbreviation
      attr_reader :zipcode
      attr_reader :plus4_code
      attr_reader :delivery_point
      attr_reader :delivery_point_check_digit

      def initialize(hash)
        super(hash)
        @urbanization = get_optional_string(hash, :urbanization)
        @primary_number = get_optional_string(hash, :primary_number)
        @street_name = get_optional_string(hash, :street_name)
        @street_predirection = get_optional_string(hash, :street_predirection)
        @street_postdirection = get_optional_string(hash, :street_postdirection)
        @street_suffix = get_optional_string(hash, :street_suffix)
        @secondary_number = get_optional_string(hash, :secondary_number)
        @secondary_designator = get_optional_string(hash, :secondary_designator)
        @extra_secondary_number = get_optional_string(hash, :extra_secondary_number)
        @extra_secondary_designator = get_optional_string(hash, :extra_secondary_designator)
        @pmb_designator = get_optional_string(hash, :pmb_designator)
        @pmb_number = get_optional_string(hash, :pmb_number)
        @city_name = get_optional_string(hash, :city_name)
        @default_city_name = get_optional_string(hash, :default_city_name)
        @state_abbreviation = get_optional_string(hash, :state_abbreviation)
        @zipcode = get_optional_string(hash, :zipcode)
        @plus4_code = get_optional_string(hash, :plus4_code)
        @delivery_point = get_optional_string(hash, :delivery_point)
        @delivery_point_check_digit = get_optional_string(hash, :delivery_point_check_digit)
      end
    end

    class Metadata < BaseJsonObject

      attr_reader :record_type
      attr_reader :zip_type
      attr_reader :county_fips
      attr_reader :county_name
      attr_reader :carrier_route
      attr_reader :congressional_district
      attr_reader :building_default_indicator
      attr_reader :rdi
      attr_reader :elot_sequence
      attr_reader :elot_sort
      attr_reader :latitude
      attr_reader :longitude
      attr_reader :precision
      attr_reader :time_zone
      attr_reader :utc_offset
      attr_reader :dst

      def initialize(hash)
        super(hash)
        @record_type = get_optional_string(hash, :record_type)
        @zip_type = get_optional_string(hash, :zip_type)
        @county_fips = get_optional_string(hash, :county_fips)
        @county_name = get_optional_string(hash, :county_name)
        @carrier_route = get_optional_string(hash, :carrier_route)
        @congressional_district = get_optional_string(hash, :congressional_district)
        @building_default_indicator = get_optional_string(hash, :building_default_indicator)
        @rdi = get_optional_string(hash, :rdi)
        @elot_sequence = get_optional_string(hash, :elot_sequence)
        @elot_sort = get_optional_string(hash, :elot_sort)
        @latitude = get_optional_number(hash, :latitude)
        @longitude = get_optional_number(hash, :longitude)
        @precision = get_optional_string(hash, :precision)
        @time_zone = get_optional_string(hash, :time_zone)
        @utc_offset = get_optional_fixnum(hash, :utc_offset)
        @dst = get_optional_boolean(hash, :dst)
      end
    end

    class Analysis < BaseJsonObject

      attr_reader :dpv_match_code
      attr_reader :dpv_footnotes
      attr_reader :dpv_cmra
      attr_reader :dpv_vacant
      attr_reader :active
      attr_reader :ews_match
      attr_reader :footnotes
      attr_reader :lacslink_code
      attr_reader :lacslink_indicator
      attr_reader :suitelink_match

      def initialize(hash)
        super(hash)
        @dpv_match_code = get_optional_string(hash, :dpv_match_code)
        @dpv_footnotes = get_optional_string(hash, :dpv_footnotes)
        @dpv_cmra = get_optional_string(hash, :dpv_cmra)
        @dpv_vacant = get_optional_string(hash, :dpv_vacant)
        @active = get_optional_string(hash, :active)
        @ews_match = get_optional_boolean(hash, :ews_match)
        @footnotes = get_optional_string(hash, :footnotes)
        @lacslink_code = get_optional_string(hash, :lacslink_code)
        @lacslink_indicator = get_optional_string(hash, :lacslink_indicator)
        @suitelink_match = get_optional_boolean(hash, :suitelink_match)
      end
    end
  end
end
