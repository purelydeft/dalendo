class CreateProjectTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_types do |t|
      t.string :name
      t.string :slug
      t.integer :status

      t.timestamps
    end
  end
end
