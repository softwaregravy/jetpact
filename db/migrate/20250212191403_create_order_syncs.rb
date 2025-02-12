class CreateOrderSyncs < ActiveRecord::Migration[7.2]
  def change
    create_table :order_syncs do |t|
      t.string :primary_shop_order_id, null: false
      t.string :partner_shop_domain, null: false
      t.string :partner_order_id
      t.string :status, null: false
      t.string :error_message
      t.string :last_order_failure_reason
      t.integer :retry_count, null: false, default: 0
      t.datetime :last_attempted_at

      t.timestamps

      t.index :partner_shop_domain
      t.index :primary_shop_order_id
    end
  end
end
