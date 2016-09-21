class CreateTwords < ActiveRecord::Migration[5.0]
  def change
    create_table :twords do |t|
      t.string :word
      t.string :word_inflection
      t.references :gram_form, foreign_key: true
      t.references :dialect, foreign_key: true
      t.string :additional_info

      t.timestamps
    end
  end
end
