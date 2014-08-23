class CreateAuthorizationCodes < ActiveRecord::Migration
  def change
    create_table :authorization_codes, force: true do |t|
      t.integer  :account_id
      t.integer  :client_id
      t.string   :token
      t.string   :redirect_uri
      t.datetime :expires_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
