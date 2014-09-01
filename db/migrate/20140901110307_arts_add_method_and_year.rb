class ArtsAddMethodAndYear < ActiveRecord::Migration
  def up
    add_column :arts, :medium, :string
    add_column :arts, :year, :integer
  end

  def down
    remove_column :arts, :medium, :string
    remove_column :arts, :year, :integer
  end
end
