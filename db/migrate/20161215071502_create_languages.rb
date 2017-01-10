class CreateLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :language_name
      t.string :language_code
      t.string :language_status

      t.timestamps
    end
  end
end
