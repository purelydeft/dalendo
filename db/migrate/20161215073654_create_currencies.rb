class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string :currency_name
      t.string :currency_code
      t.string :currency_status

      t.timestamps
    end
  end
end
