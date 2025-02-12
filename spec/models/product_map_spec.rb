# == Schema Information
#
# Table name: product_maps
#
#  id                      :bigint           not null, primary key
#  partner_shop_domain     :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  partner_product_id      :string           not null
#  partner_variant_id      :string           not null
#  primary_shop_product_id :string           not null
#  primary_shop_variant_id :string           not null
#
# Indexes
#
#  index_product_maps_on_partner_product_id       (partner_product_id)
#  index_product_maps_on_partner_shop_domain      (partner_shop_domain)
#  index_product_maps_on_primary_shop_product_id  (primary_shop_product_id)
#
require 'rails_helper'

RSpec.describe ProductMap, type: :model do
  it "has a valid factory" do
    expect {
      create(:product_map)
    }.to change(ProductMap, :count).by(1)
  end
end
