# frozen_string_literal: true

module Legion
  module Extensions
    module Skill
      module Superpowers
        module Skills
          class WritingPlans < Legion::LLM::Skills::Base
            skill_name  'writing_plans'
            namespace   'superpowers'
            description 'Write bite-sized TDD implementation plans for agentic execution'
            trigger_words 'write plan', 'implementation plan', 'create plan'

            def inject_planning_context(context: {}) # rubocop:disable Lint/UnusedMethodArgument
              Legion::LLM::Skills::StepResult.new(
                inject:   self.class.content,
                gate:     nil,
                metadata: { step: 'inject_planning_context' }
              )
            end

            steps :inject_planning_context

            class << self
              def content_path
                ::File.expand_path('../../../../../../content/writing_plans/SKILL.md', __dir__)
              end
            end
          end
        end
      end
    end
  end
end
