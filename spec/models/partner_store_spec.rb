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
require 'rails_helper'

RSpec.describe PartnerStore, type: :model do
  it "has a valid factory" do 
    expect {
    create(:partner_store)
    }.to change(PartnerStore, :count).by(1)
  end
end
