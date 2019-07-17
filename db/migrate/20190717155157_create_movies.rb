class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :url_image
      t.date :start_date
      t.date :finish_date
      t.boolean :block

      t.timestamps
    end
  end
end
