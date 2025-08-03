# frozen_string_literal: true

require 'rspec'

describe FfcrmWebookhookReadAi::MeetingEndpoint do
  let(:payload) { JSON.load('./spec/test_data/payload.json') }
  describe '#process' do
    context 'authenticated' do
      it 'matches a user'
      context 'with an existing lead' do
        it 'adds a note to the lead'
      end
      context 'with an existing contact' do
        it 'adds a note to the contact'
      end
      context 'with no existing lead or contact' do
        it 'creates a lead from the meeting details'
      end
    end

    context 'unauthenticated' do
      it 'rejects'
    end
  end
end
