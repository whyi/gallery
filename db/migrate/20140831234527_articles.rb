class Articles < ActiveRecord::Migration
  def up
    add_column :articles, :category_cd, :integer
    add_column :articles, :width, :integer
    add_column :articles, :height, :integer
    add_column :articles, :filename, :string
  end

  def down
    remove_column :articles, :category_cd
    remove_column :articles, :width
    remove_column :articles, :height
    remove_column :articles, :filename
  end
end
