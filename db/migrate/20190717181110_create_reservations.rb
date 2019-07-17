class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :name
      t.string :identification
      t.date :date
      t.string :phone
      t.boolean :block, default: false
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
