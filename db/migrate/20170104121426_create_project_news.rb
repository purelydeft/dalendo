class CreateProjectNews < ActiveRecord::Migration[5.0]
  def change
    create_table :project_news do |t|
      t.integer :project_id
      t.integer :news_by
      t.text :news_description
      t.string :news_filename
      t.integer :status

      t.timestamps
    end
  end
end
