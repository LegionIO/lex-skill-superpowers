# frozen_string_literal: true

require 'bundler/setup'

# Stub Legion::Logging before loading legion-llm
module Legion
  module Logging
    module Helper
      def log
        @_log ||= Object.new.tap do |l|
          %i[debug info warn error fatal].each do |m|
            l.define_singleton_method(m) { |*| }
          end
        end
      end
    end

    class << self
      def debug(msg = nil); end
      def info(msg = nil); end
      def warn(msg = nil); end
      def error(msg = nil); end
      def fatal(msg = nil); end
    end
  end

  module Settings
    @store = {}

    class << self
      def [](key)
        @store[key.to_sym] ||= {}
      end

      def []=(key, value)
        @store[key.to_sym] = value
      end

      def key?(key)
        @store.key?(key.to_sym)
      end

      def dig(*keys)
        keys = keys.map(&:to_sym)
        result = @store
        keys.each do |k|
          return nil unless result.is_a?(Hash)

          result = result[k]
        end
        result
      end

      def merge_settings(key, defaults)
        current = @store[key.to_sym] || {}
        @store[key.to_sym] = defaults.merge(current)
      end

      def reset!
        @store = {}
      end
    end
  end
end

require 'legion/llm/errors'
require 'legion/llm/skills/errors'
require 'legion/llm/skills/step_result'
require 'legion/llm/skills/skill_run_result'
require 'legion/llm/skills/base'
require 'legion/llm/skills/registry'
require 'lex/skill/superpowers'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |c| c.syntax = :expect }

  config.before(:each) do
    Legion::LLM::Skills::Registry.reset!
    Legion::LLM::Skills::Registry.register(Lex::Skill::Superpowers::Skills::Brainstorming)
    Legion::LLM::Skills::Registry.register(Lex::Skill::Superpowers::Skills::TestDrivenDevelopment)
    Legion::LLM::Skills::Registry.register(Lex::Skill::Superpowers::Skills::SystematicDebugging)
    Legion::LLM::Skills::Registry.register(Lex::Skill::Superpowers::Skills::WritingPlans)
    Legion::LLM::Skills::Registry.register(Lex::Skill::Superpowers::Skills::ExecutingPlans)
  end
end
