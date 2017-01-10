class CreateProjectRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :project_rewards do |t|

      t.timestamps
    end
  end
end
