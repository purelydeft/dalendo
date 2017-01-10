class CreateProjectFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :project_followers do |t|
      t.integer :project_id
      t.integer :follower_id
      t.integer :notification_status

      t.timestamps
    end
  end
end
