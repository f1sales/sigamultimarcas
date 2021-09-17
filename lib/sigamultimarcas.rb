# frozen_string_literal: true

require_relative "sigamultimarcas/version"
require "f1sales_custom/source"
require "f1sales_custom/parser"
require "f1sales_helpers"

module Sigamultimarcas
  class Error < StandardError; end
  class F1SalesCustom::Email::Source
    def self.all
      [
        {
          email_id: 'website',
          name: 'Website'
        }
      ]
    end
  end
  class F1SalesCustom::Email::Parser
    def parse
      parsed_email = @email.body.colons_to_hash
      source = F1SalesCustom::Email::Source.all[0]

      {
        source: {
          name: source[:name]
        },
        customer: {
          name: parsed_email['de'],
          phone: parsed_email['telwhatsapp'],
          email: parsed_email['email']
        },
        message: parsed_email['carro_de_interesse']
      }
    end
  end
end
