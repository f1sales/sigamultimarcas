require 'ostruct'
require 'byebug'
require "f1sales_custom/parser"
require "f1sales_custom/source"

RSpec.describe F1SalesCustom::Email::Parser do
  context 'when came from the website' do
    let(:email) do
      email = OpenStruct.new
      email.to = [email: 'website@sigamultimarcas.f1sales.net']
      email.subject = "Email do site: \"[your-subject]\""
      email.body = "De: Teste Lead Site SIGA\nTel/WhatsApp: 13931313131\nE-mail: teste@lead.com\nCarro de Interesse: Commander Limited T270 Flex"

      email
    end

    let(:parsed_email) { described_class.new(email).parse }

    it 'contains lead website a source name' do
      expect(parsed_email[:source][:name]).to eq('Website')
    end

    it 'contains name' do
      expect(parsed_email[:customer][:name]).to eq('Teste Lead Site SIGA')
    end

    it 'contains phone' do
      expect(parsed_email[:customer][:phone]).to eq('13931313131')
    end

    it 'contains email' do
      expect(parsed_email[:customer][:email]).to eq('teste@lead.com')
    end

    it 'contains message' do
      expect(parsed_email[:message]).to eq('Commander Limited T270 Flex')
    end
  end
end
