class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|

      t.timestamps
    end
  end
end
