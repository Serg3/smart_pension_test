# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
  minimum_coverage(96.00)
  refuse_coverage_drop
end
