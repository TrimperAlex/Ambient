class CreateWeatherEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_events do |t|
      t.text :description
      t.string :category
      t.float :temperature
      t.string :image_url
      t.float :price
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
