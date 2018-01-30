require "activeadmin-localize/version"
require 'activeadmin-localize/formtastic'
require 'activeadmin-localize/attributes_table'
require 'activeadmin-localize/columns'
require 'activeadmin-localize/engine'

module ActiveAdmin
  module Localize
    autoload :Field, 'activeadmin-localize/field'

    class << self
      attr_writer :locales

      def locales
        @locales || I18n.available_locales
      end

      def configure
        yield self
      end
    end
  end
end
