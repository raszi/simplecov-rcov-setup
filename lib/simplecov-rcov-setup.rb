# frozen_string_literal: true

require 'simplecov'
require 'simplecov-rcov'
require 'simplecov-rcov-setup/version'

module SimpleCov
  module Formatter
    class RcovFormatter
      class Setup
        @formatters = [SimpleCov::Formatter::HTMLFormatter, SimpleCov::Formatter::RcovFormatter]
        @profile = nil
        @filtered = %w[.bundle bundle vendor/bundler spec]

        class << self
          attr_writer :formatters, :filtered, :profile

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
  end
end
