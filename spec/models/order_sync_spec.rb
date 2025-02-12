# == Schema Information
#
# Table name: order_syncs
#
#  id                        :bigint           not null, primary key
#  error_message             :string
#  last_attempted_at         :datetime
#  last_order_failure_reason :string
#  retry_count               :integer          default(0), not null
#  status                    :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  partner_order_id          :string
#  partner_store_id          :bigint           not null
#  primary_shop_order_id     :string           not null
#
# Indexes
#
#  index_order_syncs_on_partner_store_id       (partner_store_id)
#  index_order_syncs_on_primary_shop_order_id  (primary_shop_order_id)
#
# Foreign Keys
#
#  fk_rails_...  (partner_store_id => partner_stores.id)
#
require 'rails_helper'

RSpec.describe OrderSync, type: :model do
  it "has a valid factory" do
    expect {
      create(:order_sync)
    }.to change(OrderSync, :count).by(1)
  end
end
