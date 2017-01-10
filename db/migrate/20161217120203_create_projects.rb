class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :category_id
      t.string :project_type
      t.string :project_title
      t.string :project_image
      t.string :short_desp
      t.string :project_location
      t.string :project_startdate
      t.string :project_enddate
      t.string :currency
      t.integer :project_minimum_fundinggoal
      t.integer :project_funding_goal
      t.integer :user_id
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
