class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :user_name
      t.text :email
      t.text :password
      t.text :address
      t.text :country
      t.text :state
      t.text :city
      t.integer :phone_number
      t.text :register_ip
      t.text :last_login_ip
      t.text :login_type
      t.text :facebook_id
      t.text :google_id
      t.text :linkedin_id
      t.text :twitter_id
      t.text :user_role
      t.text :user_status

      t.timestamps
    end
  end
end
