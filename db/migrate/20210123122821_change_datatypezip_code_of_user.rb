class ChangeDatatypezipCodeOfUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :zip_code, 'string'
  end
end
