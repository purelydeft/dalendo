class CreateBadges < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.string :badge_name
      t.string :badge_description
      t.string :badge_image
      t.string :badge_status

      t.timestamps
    end
  end
end
