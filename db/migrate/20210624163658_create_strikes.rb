# frozen_string_literal: true

class CreateStrikes < ActiveRecord::Migration[6.1]
  def change
    create_table :strikes do |t|
      t.references :user

      t.timestamps
    end
  end
end
