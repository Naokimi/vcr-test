require 'rails_helper'

RSpec.describe ApiCaller, :vcr, type: :model do
  subject(:caller) { described_class.new }

  before(:each) do
    HTTParty.get('https://mugenmonkey.com/api/v0/ds3_weapons')
  end

  before(:all) do
    HTTParty.get('https://mugenmonkey.com/api/v0/ds3_spells')
  end

  after(:each) do
    HTTParty.get('https://mugenmonkey.com/api/v0/ds3_rings')
  end

  after(:all) do
    HTTParty.get('https://mugenmonkey.com/api/v0/ds3_armors')
  end

  describe '#builds_to_lvl_20' do
    it 'returns less than 10k builds' do
      expect(caller.builds_to_lvl_20['count']).to be < 10_000
    end
  end

  describe '#builds_from_lvl_20' do
    it 'returns more than 20k builds' do
      expect(caller.builds_from_lvl_20['count']).to be > 20_000
    end
  end
end
