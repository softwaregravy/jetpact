# == Schema Information
#
# Table name: order_syncs
#
#  id                        :bigint           not null, primary key
#  error_message             :string
#  last_attempted_at         :datetime
#  last_order_failure_reason :string
#  partner_shop_domain       :string           not null
#  retry_count               :integer          default(0), not null
#  status                    :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  partner_order_id          :string
#  primary_shop_order_id     :string           not null
#
# Indexes
#
#  index_order_syncs_on_partner_shop_domain    (partner_shop_domain)
#  index_order_syncs_on_primary_shop_order_id  (primary_shop_order_id)
#
require 'rails_helper'

RSpec.describe OrderSync, type: :model do
  it "has a valid factory" do
    expect {
      create(:order_sync)
    }.to change(OrderSync, :count).by(1)
  end
end
