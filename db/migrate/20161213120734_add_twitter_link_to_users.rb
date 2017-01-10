class AddTwitterLinkToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_link, :string
  end
end
