class CreateFighters < ActiveRecord::Migration[5.2]
  def change
    create_table :fighters do |t|
      t.string :name
      t.string :name_tag

      t.timestamps
    end
  end
end
