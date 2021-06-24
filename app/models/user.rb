# frozen_string_literal: true

class User < ApplicationRecord
  has_many :strikes, dependent: :destroy
end
