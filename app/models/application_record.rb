# frozen_string_literal: true

# Base AR object
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
