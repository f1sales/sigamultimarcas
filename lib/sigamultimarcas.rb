# frozen_string_literal: true

require_relative "sigamultimarcas/version"
require "f1sales_custom/source"
require "f1sales_custom/parser"
require "f1sales_helpers"

module Sigamultimarcas
  class Error < StandardError; end
  class F1SalesCustom::Email::Source
    def self.all
      # ...
    end
  end
  class F1SalesCustom::Email::Parser
    def parse
      # ...
    end
  end
end
