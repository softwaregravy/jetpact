class AddPartnerStoreReferenceToProductMap < ActiveRecord::Migration[7.2]
  def change
    add_reference :product_maps, :partner_store, null: false, foreign_key: true
  end
end
