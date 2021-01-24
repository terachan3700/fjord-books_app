# frozen_string_literal: true

class AddColumnToUser < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :zip_code, :integer
    add_column :users, :address, :string
    add_column :users, :self_introduction, :text
  end

  def down
    remove_column :users, :zip_code, :integer
    remove_column :users, :address, :string
    remove_column :users, :self_introduction, :text
  end
end
