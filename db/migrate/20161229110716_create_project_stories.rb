class CreateProjectStories < ActiveRecord::Migration[5.0]
  def change
    create_table :project_stories do |t|

      t.timestamps
    end
  end
end
