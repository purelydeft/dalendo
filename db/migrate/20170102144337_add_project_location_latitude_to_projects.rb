class AddProjectLocationLatitudeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_location_latitude, :string
  end
end
