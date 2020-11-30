class AddEnviadoToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :enviado, :boolean
  end
end
