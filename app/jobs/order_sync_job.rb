class OrderSyncJob < ApplicationJob
  queue_as :default

  def perform(primary_shop_order_id)
    Rails.logger.info "Processing order: #{primary_shop_order_id}"
  rescue StanardError => e
    Rails.logger.error "Error, failed to process: #{e.message}"
    raise
  end
end
