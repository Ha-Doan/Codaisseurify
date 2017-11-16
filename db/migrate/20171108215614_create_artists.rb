class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.date :date_of_birth
      t.string :nationality

      t.timestamps
    end
  end
end
