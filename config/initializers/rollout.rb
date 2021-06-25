# frozen_string_literal: true

require 'redis'

# Rollout wrapper

# Return singleton instance
class Rollout
  def self.instance
    @instance ||= new(Redis::Namespace.new(Rails.env, redis: Redis.current))
  end
end

# Add default features
Rollout.instance.set_feature_data :joza, description: 'Has one strike'
Rollout.instance.set_feature_data :zagen, description: 'Has two strike'
Rollout.instance.set_feature_data :osho, description: 'Has three strike'
Rollout.instance.set_feature_data :dai, description: 'Has four strike'
Rollout.instance.set_feature_data :shike, description: 'Has five strike'
