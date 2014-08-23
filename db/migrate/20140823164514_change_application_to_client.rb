class ChangeApplicationToClient < ActiveRecord::Migration
  def change
    rename_table :applications, :clients
  end
end
