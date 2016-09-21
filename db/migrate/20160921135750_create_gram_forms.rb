class CreateGramForms < ActiveRecord::Migration[5.0]
  def change
    create_table :gram_forms do |t|
      t.string :name

      t.timestamps
    end
  end
end
