class AddCharactersToFighters < ActiveRecord::Migration[5.2]
  def change
    add_reference :fighters, :character, foreign_key: true
  end
end
