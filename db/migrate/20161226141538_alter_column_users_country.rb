class AlterColumnUsersCountry < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.change :country, :integer
    end
  end
  def self.down
    change_table :users do |t|
      t.change :country, :string
    end
  end
end
