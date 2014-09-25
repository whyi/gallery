class AddUserIdToArts < ActiveRecord::Migration
  def up    
    add_column :arts, :user_id, :integer

    execute <<-SQL
      ALTER TABLE arts
        ADD CONSTRAINT fk_user_id
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    SQL

  end

  def down
    remove_column :arts, :user_id, :integer
 
    execute <<-SQL
      ALTER TABLE arts
        DROP FOREIGN KEY fk_user_id
    SQL

  end
end
