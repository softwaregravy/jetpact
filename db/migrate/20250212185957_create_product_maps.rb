class CreateProductMaps < ActiveRecord::Migration[7.2]
  def change
    create_table :product_maps do |t|
      t.string :primary_shop_product_id, null: false
      t.string :partner_shop_domain, null: false
      t.string :partner_product_id, null: false
      t.string :primary_shop_variant_id, null: false
      t.string :partner_variant_id, null: false

      t.timestamps

      t.index :partner_shop_domain
      t.index :primary_shop_product_id
      t.index :partner_product_id
    end
  end
end
