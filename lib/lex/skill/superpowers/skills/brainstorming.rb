# frozen_string_literal: true

module Lex
  module Skill
    module Superpowers
      module Skills
        class Brainstorming < Legion::LLM::Skills::Base
          skill_name  'brainstorming'
          namespace   'superpowers'
          description 'Collaborative design brainstorming — turns ideas into specs'
          trigger_words 'brainstorm', 'design', 'idea', 'spec'

          def explore_context(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   self.class.content,
              gate:     nil,
              metadata: { step: 'explore_context' }
            )
          end

          def clarify_requirements(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   nil,
              gate:     { type: :user_input, prompt: 'What would you like to build?' },
              metadata: { step: 'clarify_requirements' }
            )
          end

          def propose_approaches(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   nil,
              gate:     { type: :user_input, prompt: 'Review the approaches above and choose one.' },
              metadata: { step: 'propose_approaches' }
            )
          end

          def present_design(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   nil,
              gate:     { type: :user_input, prompt: 'Does this design look correct?' },
              metadata: { step: 'present_design' }
            )
          end

          def write_spec(context: {}) # rubocop:disable Lint/UnusedMethodArgument
            Legion::LLM::Skills::StepResult.new(
              inject:   nil,
              gate:     nil,
              metadata: { step: 'write_spec', complete: true }
            )
          end

          steps :explore_context, :clarify_requirements, :propose_approaches,
                :present_design, :write_spec

          class << self
            def content_path
              ::File.expand_path('../../../../../../../content/brainstorming/SKILL.md', __dir__)
            end
          end
        end
      end
    end
  end
end
