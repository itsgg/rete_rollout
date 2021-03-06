# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :strike, mutation: Mutations::Strike
  end
end
