# frozen_string_literal: true

module Lex
  module Skill
    module Superpowers
      module Skills
        class SystematicDebugging < Legion::LLM::Skills::Base
          skill_name  'systematic_debugging'
          namespace   'superpowers'
          description 'Diagnose-first debugging: reproduce, hypothesize, probe, fix'
          trigger_words 'debug', 'diagnose', 'fix bug', 'root cause'

          def inject_debugging_context(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   self.class.content,
              gate:     nil,
              metadata: { step: 'inject_debugging_context' }
            )
          end

          steps :inject_debugging_context

          class << self
            def content_path
              ::File.expand_path('../../../../../../../content/systematic_debugging/SKILL.md', __dir__)
            end
          end
        end
      end
    end
  end
end
