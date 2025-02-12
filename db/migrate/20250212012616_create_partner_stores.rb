class CreatePartnerStores < ActiveRecord::Migration[7.2]
  def change
    create_table :partner_stores do |t|
      t.string :shop_domain, null: false
      t.string :access_token
      t.string :status, null: false
      t.datetime :uninstall_date

      t.timestamps
    end
    add_index :partner_stores, :shop_domain, unique: true
  end
end
