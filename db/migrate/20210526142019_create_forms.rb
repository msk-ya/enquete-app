class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.text :html
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
