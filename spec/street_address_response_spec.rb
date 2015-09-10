require 'spec_helper'

describe SmartyStreets::StreetAddressResponse do
  let(:latitude)  { 38.8977 }
  let(:longitude) { 77.0366 }

  let(:hash) {
    {
      metadata: {
        latitude: latitude,
        longitude: longitude,
      }
    }
  }

  subject { described_class.new(hash) }

  shared_context "an address with a parseable latitude" do
    it "parses the latitude correctly" do
      expect(subject.metadata.latitude).to eq(latitude)
    end
  end

  shared_context "an address with a parseable longitude" do
    it "parses the longitude correctly" do
      expect(subject.metadata.longitude).to eq(longitude)
    end
  end

  context "an address with a float latitude/longitude" do
    it_behaves_like "an address with a parseable latitude"
    it_behaves_like "an address with a parseable longitude"
  end

  context "an address with integer latitude" do
    let(:latitude) { 42 }
    it_behaves_like "an address with a parseable latitude"
    it_behaves_like "an address with a parseable longitude"
  end

  context "an address with integer longitude" do
    let(:longitude) { 42 }
    it_behaves_like "an address with a parseable latitude"
    it_behaves_like "an address with a parseable longitude"
  end
end
