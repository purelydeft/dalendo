class AddRegistercodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :registercode, :string
  end
end
