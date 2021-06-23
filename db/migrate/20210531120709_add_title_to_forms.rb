class AddTitleToForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :title, :text
    add_column :forms, :form_type, :integer, default: 0
  end
end
