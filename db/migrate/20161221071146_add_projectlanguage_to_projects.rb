class AddProjectlanguageToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :projectlanguage, :string
  end
end
