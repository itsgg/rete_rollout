# frozen_string_literal: true

require 'wongi-engine'

# Rete rule engine
class Rete
  def initialize
    raise 'Singleton class cannot be initialized'
  end

  def self.instance
    @instance ||= Wongi::Engine.create
  end
end

# Rules can be defined any where
Rete.instance.rule 'level-up' do
  forall do
    has :User, :strike, :Strike
  end

  make do
    action do |token|
      user = token[:User]
      level = Rollout.instance.features[user.strikes.count - 1]
      return if level.blank?

      Rollout.instance.activate_user level, user
    end
  end
end
