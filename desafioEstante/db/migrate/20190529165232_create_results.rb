class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :athlete
      t.float :value
      t.string :unit
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
