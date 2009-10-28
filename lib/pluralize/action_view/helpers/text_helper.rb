module ActionView
  module Helpers #:nodoc:
    module TextHelper
      def pluralize(count, singular, plural = nil)
        "#{count || 0} " + ((count == 1 || count == '1') ? singular : (plural || ActiveSupport::Inflector.pluralize(singular, count)))
      end
    end
  end
end