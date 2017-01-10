class CreateProjectSupporters < ActiveRecord::Migration[5.0]
  def change
    create_table :project_supporters do |t|
      t.integer :project_id
      t.integer :supported_by
      t.integer :status

      t.timestamps
    end
  end
end
