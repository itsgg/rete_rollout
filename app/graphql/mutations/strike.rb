# frozen_string_literal: true

module Mutations
  class Strike < BaseMutation
    type Boolean
    null true

    argument :user_id, ID, required: true

    def resolve(user_id:)
      User.find(user_id).strikes.create!
    end
  end
end
