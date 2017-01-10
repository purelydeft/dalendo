class AddProjectLocationLongitudeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_location_longitude, :string
  end
end
