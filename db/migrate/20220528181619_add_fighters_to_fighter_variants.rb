class AddFightersToFighterVariants < ActiveRecord::Migration[5.2]
  def change
    add_reference :fighter_variants, :fighter, foreign_key: true
  end
end
