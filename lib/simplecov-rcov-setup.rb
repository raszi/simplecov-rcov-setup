require 'simplecov'
require 'simplecov-rcov'
require 'simplecov-rcov-setup/version'

class SimpleCov::Formatter::RcovFormatter
  class Setup
    @formatters = [SimpleCov::Formatter::HTMLFormatter, SimpleCov::Formatter::RcovFormatter]
    @profile = nil
    @filtered = %w(.bundle bundle vendor/bundler spec)

    class << self
      attr_accessor :filtered
      attr_writer :formatters, :profile

      def unconditionally(&block)
        SimpleCov.formatters = @formatters
        SimpleCov.start(@profile) do
          @filtered.each { |filter| add_filter("/#{filter}") }
          instance_eval(&block) if block
        end
      end

      def conditionally(&block)
        unconditionally(&block) if ENV['COVERAGE'] == 'on'
      end
    end
  end
end
