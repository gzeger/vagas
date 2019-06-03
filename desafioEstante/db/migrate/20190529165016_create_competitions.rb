class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :name
      t.numeric :status, default: 0

      t.timestamps
    end
  end
end
