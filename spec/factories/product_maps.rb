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
FactoryBot.define do
  factory :product_map do
    primary_shop_product_id { rand(10000000..99999999).to_s }
    partner_shop_domain { "#{Faker::Internet.domain_word}.myshopify.com" }
    partner_product_id { rand(10000000..99999999).to_s }
    primary_shop_variant_id { rand(10000000..99999999).to_s }
    partner_variant_id { rand(10000000..99999999).to_s }
  end
end
