class AddUserNameToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :user_name, :string
  end
end
