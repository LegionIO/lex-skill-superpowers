# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lex::Skill::Superpowers do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be_nil
  end

  it 'is a Legion extension module' do
    expect(described_class).to respond_to(:runner_modules)
  end
end
