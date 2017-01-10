class CreateProjectAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :project_accounts do |t|

      t.timestamps
    end
  end
end
