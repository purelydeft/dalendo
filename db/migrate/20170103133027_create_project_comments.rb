class CreateProjectComments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_comments do |t|
      t.integer :project_id
      t.integer :commented_by
      t.string :comment
      t.integer :status

      t.timestamps
    end
  end
end
