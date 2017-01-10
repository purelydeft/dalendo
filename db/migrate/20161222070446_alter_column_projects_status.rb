class AlterColumnProjectsStatus < ActiveRecord::Migration[5.0]
  def self.up
    change_table :projects do |t|
      t.change :status, :integer
    end
  end
  def self.down
    change_table :projects do |t|
      t.change :status, :string
    end
  end
end
