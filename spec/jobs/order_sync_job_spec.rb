require 'rails_helper'

RSpec.describe OrderSyncJob, type: :job do
  describe '#perform' do
    let(:spree_order_id) { "order_123" }
   around do |example|
      GoodJob.preserve_job_records = true
      example.run
      GoodJob.preserve_job_records = false
    end

    it 'can be enqueued' do
      expect {
        described_class.perform_later(spree_order_id)
      }.to have_enqueued_job(described_class).with(spree_order_id)
    end

    it 'logs the order processing' do
      allow(Rails.logger).to receive(:info)
      described_class.perform_now(spree_order_id)
      expect(Rails.logger).to have_received(:info).with(/#{spree_order_id}/)
    end
  end
end
