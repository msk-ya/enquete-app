class AddLimitToEnquete < ActiveRecord::Migration[5.2]
  def change
    add_column :enquetes, :limit, :date
    add_column :enquetes, :area, :string
  end
end
