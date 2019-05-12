# frozen_string_literal: true

require 'spec_helper'

describe Grammer::IgService do
  it { expect(described_class).to include(HTTParty) }

  context "#initialize" do
    it 'sets given JSON parser' do
      JSONParser = Struct.new('JSONParser')
      service = described_class.new(json_parser: JSONParser)
      json_parser = service.instance_eval { @json_parser }
      expect(json_parser).to eq(JSONParser)
    end

    it 'sets given HTML parser' do
      HTMLParser = Struct.new('HTMLParser')
      service = described_class.new(html_parser: HTMLParser)
      html_parser = service.instance_eval { @html_parser }
      expect(html_parser).to be(HTMLParser)
    end
  end

  context '#node' do
    it 'returns empty hash when no instagram user was found' do
      not_found_page = File.read('spec/fixtures/instagram_user_not_found.html')
      allow(described_class).to receive_message_chain(:get) { not_found_page }
      expect(subject.node('invalid_instagram_user')).to eq({})
    end
  end
end
