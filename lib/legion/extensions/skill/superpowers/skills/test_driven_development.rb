# frozen_string_literal: true

module Legion
  module Extensions
    module Skill
      module Superpowers
        module Skills
          class TestDrivenDevelopment < Legion::LLM::Skills::Base
            skill_name  'test_driven_development'
            namespace   'superpowers'
            description 'Red-green-refactor TDD cycle for feature implementation'
            trigger_words 'tdd', 'test-driven', 'write tests', 'implement with tests'

            def inject_tdd_context(context: {}) # rubocop:disable Lint/UnusedMethodArgument
              Legion::LLM::Skills::StepResult.new(
                inject:   self.class.content,
                gate:     nil,
                metadata: { step: 'inject_tdd_context' }
              )
            end

            steps :inject_tdd_context

            class << self
              def content_path
                ::File.expand_path('../../../../../../content/test_driven_development/SKILL.md', __dir__)
              end
            end
          end
        end
      end
    end
  end
end
