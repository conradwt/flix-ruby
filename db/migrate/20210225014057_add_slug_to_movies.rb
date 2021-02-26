class AddSlugToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :slug, :string
  end
end
