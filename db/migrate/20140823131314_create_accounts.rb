class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, force: true do |t|
      t.string   :username
      t.string   :password
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
