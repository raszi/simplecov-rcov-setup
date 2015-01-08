require 'simplecov'
require 'simplecov-rcov'
require 'simplecov-rcov-setup/version'

class SimpleCov::Formatter::RcovFormatter
  class Setup
    @formatters = [SimpleCov::Formatter::HTMLFormatter, SimpleCov::Formatter::RcovFormatter]
    @profile = nil
    @filtered = %w(bundle vendor/bundler spec)

    class << self
      attr_writer :formatters, :filtered, :profile

      def unconditionally
        SimpleCov.formatters = @formatters
        SimpleCov.start(@profile) do
          @filtered.each { |filter| add_filter("/$#{filter}") }
        end
      end

      def conditionally
        unconditionally if ENV['COVERAGE'] == 'on'
      end
    end
  end
end
