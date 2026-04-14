# lex-skill-superpowers

Structured workflow skills for LegionIO LLM agents.

Provides five skills that guide an LLM agent through disciplined software-engineering workflows: brainstorming, TDD, debugging, plan writing, and plan execution. Each skill injects context and gates into the conversation to enforce a step-by-step process.

## Skills

| Skill | Key | Description |
|-------|-----|-------------|
| Brainstorming | `superpowers:brainstorming` | Collaborative design sessions — explore context, clarify requirements, propose approaches, present design, write spec |
| Test-Driven Development | `superpowers:test_driven_development` | Red-green-refactor TDD cycle |
| Systematic Debugging | `superpowers:systematic_debugging` | Reproduce, hypothesize, probe, fix — diagnose before patching |
| Writing Plans | `superpowers:writing_plans` | Produce bite-sized, TDD-structured implementation plans |
| Executing Plans | `superpowers:executing_plans` | Work through a plan task-by-task with checkpoint tracking |

## Installation

Add to your Gemfile:

```ruby
gem 'lex-skill-superpowers'
```

Requires `legion-llm` >= 0.6.

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

Apache-2.0
