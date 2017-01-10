class AddProjectTypeIdToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_type_id, :integer
  end
end
