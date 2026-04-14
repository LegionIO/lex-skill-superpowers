# frozen_string_literal: true

require_relative 'superpowers/version'
require_relative 'superpowers/skills/brainstorming'
require_relative 'superpowers/skills/test_driven_development'
require_relative 'superpowers/skills/systematic_debugging'
require_relative 'superpowers/skills/writing_plans'
require_relative 'superpowers/skills/executing_plans'

module Legion
  module Extensions
    module Skill
      module Superpowers
        def self.runner_modules
          []
        end

        def self.skills_required?
          true
        end
      end
    end
  end
end
