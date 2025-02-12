class AddPartnerStoreReferenceToOrderSync < ActiveRecord::Migration[7.2]
  def change
    add_reference :order_syncs, :partner_store, null: false, foreign_key: true
  end
end
