# frozen_string_literal: true

module Resolvers
  class Features < BaseResolver
    type [String], null: false

    argument :user_id, ID, required: true

    def resolve(user_id:)
      Rollout.instance.feature_states(User.find(user_id)).select { |_, active| active }.keys
    end
  end
end
