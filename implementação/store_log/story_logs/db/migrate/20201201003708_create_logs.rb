class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :name
      t.string :status
      t.datetime :hora
      t.string :position
      t.string :cerca_id
      t.references :farm, foreign_key: true

      t.timestamps
    end
  end
end
