# frozen_string_literal: true

module Lex
  module Skill
    module Superpowers
      module Skills
        class ExecutingPlans < Legion::LLM::Skills::Base
          skill_name  'executing_plans'
          namespace   'superpowers'
          description 'Execute an implementation plan task-by-task with checkpoint tracking'
          trigger_words 'execute plan', 'run plan', 'implement plan'

          def inject_execution_context(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   self.class.content,
              gate:     nil,
              metadata: { step: 'inject_execution_context' }
            )
          end

          steps :inject_execution_context

          class << self
            def content_path
              ::File.expand_path('../../../../../../../content/executing_plans/SKILL.md', __dir__)
            end
          end
        end
      end
    end
  end
end
