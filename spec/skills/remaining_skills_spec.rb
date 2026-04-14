# frozen_string_literal: true

require 'spec_helper'

[
  ['superpowers:test_driven_development', Legion::Extensions::Skill::Superpowers::Skills::TestDrivenDevelopment],
  ['superpowers:systematic_debugging',    Legion::Extensions::Skill::Superpowers::Skills::SystematicDebugging],
  ['superpowers:writing_plans',           Legion::Extensions::Skill::Superpowers::Skills::WritingPlans],
  ['superpowers:executing_plans',         Legion::Extensions::Skill::Superpowers::Skills::ExecutingPlans]
].each do |(skill_key, klass)|
  RSpec.describe klass do
    it "is registered as '#{skill_key}'" do
      expect(Legion::LLM::Skills::Registry.find(skill_key)).to eq(klass)
    end

    it 'has trigger words' do
      expect(klass.trigger_words).not_to be_empty
    end

    it 'all step methods defined' do
      klass.steps.each do |step_name|
        expect(klass.method_defined?(step_name)).to be(true)
      end
    end
  end
end
