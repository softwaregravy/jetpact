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
FactoryBot.define do
  factory :order_sync do
    association :partner_store
    primary_shop_order_id { rand(10000000..99999999).to_s }
    partner_order_id { rand(10000000..99999999).to_s }
    status { %w[pending ready_for_sync synced failed].sample }
    error_message { nil }
    last_order_failure_reason { nil }
    retry_count { 0 }
    last_attempted_at { nil }

    trait :failed do
      status { "failed" }
      error_message { Faker::Lorem.sentence }
      last_order_failure_reason { [ "api_error", "validation_failed", "reauthorization_required" ].sample }
      retry_count { rand(1..5) }
      last_attempted_at { Time.current }
    end

    trait :synced do
      status { "synced" }
      partner_order_id { rand(10000000..99999999).to_s }
      last_attempted_at { Time.current }
    end
  end
end
