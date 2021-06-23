class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.text :text_title
      t.text :select_title
      t.text :content
      t.text :select
      t.text :form_types
      t.references :enquete, foreign_key: true

      t.timestamps
    end
  end
end
