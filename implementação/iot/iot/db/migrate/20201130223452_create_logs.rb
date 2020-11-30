class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :status
      t.references :fence, foreign_key: true

      t.timestamps
    end
  end
end
