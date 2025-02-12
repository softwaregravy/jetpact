class RemovePartnerShopDomainFromOrderSync < ActiveRecord::Migration[7.2]
  def change
    remove_column :order_syncs, :partner_shop_domain, :string
  end
end
