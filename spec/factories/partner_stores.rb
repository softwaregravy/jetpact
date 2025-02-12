# == Schema Information
#
# Table name: partner_stores
#
#  id             :bigint           not null, primary key
#  access_token   :string
#  shop_domain    :string           not null
#  status         :string           not null
#  uninstall_date :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_partner_stores_on_shop_domain  (shop_domain) UNIQUE
#
FactoryBot.define do
  factory :partner_store do
    shop_domain { "#{Faker::Movie.title.dasherize}.myshopify.com" }
    access_token { SecureRandom.alphanumeric(32) }
    status { "PENDING" }
  end
end
