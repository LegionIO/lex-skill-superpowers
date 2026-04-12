# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lex::Skill::Superpowers::Skills::Brainstorming do
  it 'is registered in Legion::LLM::Skills::Registry' do
    expect(Legion::LLM::Skills::Registry.find('superpowers:brainstorming')).to eq(described_class)
  end

  it 'has trigger words' do
    expect(described_class.trigger_words).not_to be_empty
  end

  it 'has at least one step' do
    expect(described_class.steps).not_to be_empty
  end

  it 'step methods are defined on the class' do
    described_class.steps.each do |step_name|
      expect(described_class.method_defined?(step_name)).to be(true),
        "method #{step_name} not defined"
    end
  end
end
