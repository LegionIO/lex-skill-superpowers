# frozen_string_literal: true

require_relative 'lib/lex/skill/superpowers/version'

Gem::Specification.new do |spec|
  spec.name                  = 'lex-skill-superpowers'
  spec.version               = Lex::Skill::Superpowers::VERSION
  spec.authors               = ['Matthew Iverson']
  spec.summary               = 'Superpowers skill set for Legion LLM'
  spec.license               = 'Apache-2.0'
  spec.required_ruby_version = '>= 3.4'

  spec.files = Dir['lib/**/*', 'content/**/*']

  spec.add_dependency 'legion-llm', '>= 0.6'

  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop-legion'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
