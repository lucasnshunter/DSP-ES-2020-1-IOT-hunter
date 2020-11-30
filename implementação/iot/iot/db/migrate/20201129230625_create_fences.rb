class CreateFences < ActiveRecord::Migration[5.2]
  def change
    create_table :fences do |t|
      t.string :name
      t.boolean :status
      t.string :position

      t.timestamps
    end
  end
end
