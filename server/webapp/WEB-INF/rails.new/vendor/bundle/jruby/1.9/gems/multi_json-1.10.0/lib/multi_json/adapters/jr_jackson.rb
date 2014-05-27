require 'jrjackson' unless defined?(::JrJackson)
require 'multi_json/adapter'

module MultiJson
  module Adapters
    # Use the jrjackson.rb library to dump/load.
    class JrJackson < Adapter
      ParseError = ::JrJackson::ParseError

      def load(string, options={}) #:nodoc:
        # https://github.com/guyboertje/jrjackson/issues/20
        string = string.read if StringIO === string
        ::JrJackson::Json.load(string, options)
      end

      def dump(object, options={}) #:nodoc:
        ::JrJackson::Json.dump(object)
      end
    end
  end
end