class AddUserIdToActors < ActiveRecord::Migration[8.1]
  def change
    add_column :actors, :user_id, :integer
  end
end
