# frozen_string_literal: true

class Strike < ApplicationRecord
  belongs_to :user
  after_commit :trigger_rule

  private

  # Facts can be triggered from anywhere
  def trigger_rule
    Rete.instance << [user, :strike, self]
  end
end
