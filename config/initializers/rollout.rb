# frozen_string_literal: true

require 'redis'

# Rollout wrapper

# Return singleton instance
class Rollout
  def self.instance
    @instance ||= new(Redis.current)
  end
end

# Add default features
Rollout.instance.set_feature_data :joza, description: 'Has one note'
Rollout.instance.set_feature_data :zagen, description: 'Has two notes'
Rollout.instance.set_feature_data :osho, description: 'Has three notes'
Rollout.instance.set_feature_data :dai, description: 'Has four notes'
Rollout.instance.set_feature_data :shike, description: 'Has five notes'
