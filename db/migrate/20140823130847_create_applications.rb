class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications, force: true do |t|
      t.integer :account_id
      t.string :identifier
      t.string :secret
      t.string :name
      t.string :website
      t.string :redirect_uri
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
