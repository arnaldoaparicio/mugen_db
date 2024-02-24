class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :origin
      t.string :origin_tag

      t.timestamps
    end
  end
end
