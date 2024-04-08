class AddSlugToFighters < ActiveRecord::Migration[7.0]
  def change
    add_column :fighters, :slug, :string
  end
end
