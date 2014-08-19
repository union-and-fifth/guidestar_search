require_relative '../../spec_helper'

describe GuidestarSearch::Query do
  describe '#execute' do
    it 'responds without total_hits for searches with no results' do
      VCR.use_cassette('no_results') do
        query = GuidestarSearch::Query.new(city: 'Nothing', state: 'ZZ')

        query.execute

        query.parsed_response['total_hits'].must_be_nil
      end
    end

    it 'responds with total_hits for searches with results' do
      VCR.use_cassette('with_results') do
        query = GuidestarSearch::Query.new(city: 'Coulterville', state: 'CA')

        query.execute

        query.parsed_response['total_hits'].must_equal 21
      end
    end

    it 'creates an array of GuidestarSearch::Organization for searches with results' do
      VCR.use_cassette('with_results') do
        query = GuidestarSearch::Query.new(city: 'Coulterville', state: 'CA')

        query.execute

        query.organizations.first.must_be_instance_of GuidestarSearch::Organization
      end
    end
  end
end