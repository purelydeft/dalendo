class CreateProjectLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_likes do |t|
      t.integer :project_id
      t.integer :liked_by
      t.integer :status

      t.timestamps
    end
  end
end
