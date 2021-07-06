class AddUserIdToEnquetes < ActiveRecord::Migration[5.2]
  def change
    add_reference :enquetes, :user, foreign_key: true
  end
end
