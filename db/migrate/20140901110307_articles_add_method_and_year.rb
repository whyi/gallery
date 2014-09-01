class ArticlesAddMethodAndYear < ActiveRecord::Migration
  def up
    add_column :articles, :medium, :string
    add_column :articles, :year, :integer
  end

  def down
    remove_column :articles, :medium, :string
    remove_column :articles, :year, :integer
  end
end
