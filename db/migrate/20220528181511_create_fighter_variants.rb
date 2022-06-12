class CreateFighterVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :fighter_variants do |t|
      t.string :name
      t.string :author
      t.string :website
      t.string :game_name
      t.string :image

      t.timestamps
    end
  end
end
