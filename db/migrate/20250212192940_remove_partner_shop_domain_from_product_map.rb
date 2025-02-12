class RemovePartnerShopDomainFromProductMap < ActiveRecord::Migration[7.2]
  def change
    remove_column :product_maps, :partner_shop_domain, :string
  end
end
