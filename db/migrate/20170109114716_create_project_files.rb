class CreateProjectFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :project_files do |t|
      t.integer :project_id
      t.string :project_file_name
      t.string :project_file_type
      t.string :project_image_path
      t.integer :status

      t.timestamps
    end
  end
end
