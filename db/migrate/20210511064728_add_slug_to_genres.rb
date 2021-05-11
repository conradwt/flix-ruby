class AddSlugToGenres < ActiveRecord::Migration[6.1]
  def up
    add_column :genres, :slug, :string

    Genre.reset_column_information

    Genre.all.map(&:save)
  end

  def down
    remove_column :genres, :slug
  end
end
