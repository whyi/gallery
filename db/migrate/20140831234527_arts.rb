class Arts < ActiveRecord::Migration
  def up
    add_column :arts, :category_cd, :integer
    add_column :arts, :width, :integer
    add_column :arts, :height, :integer
    add_column :arts, :filename, :string
  end

  def down
    remove_column :arts, :category_cd
    remove_column :arts, :width
    remove_column :arts, :height
    remove_column :arts, :filename
  end
end
