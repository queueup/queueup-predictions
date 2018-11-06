# frozen_string_literal: true

class AddSlugToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slug, :string

    User.find_each(&:save)
  end
end
