class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :age, :integer, limit: 1
  end
end
