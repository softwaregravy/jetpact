
## PowerPact Consolidated Requirements

### 1. Overview & Objectives

- **Product:** PowerPact, a Shopify embedded app developed by Pact.
- **Purpose:** Enable partner stores to become drop-ship providers for Bubbly, Pact's Shopify storefront.
- **Key Functionality:** Bubbly sells partner products, and PowerPact pushes relevant orders back to the original partner stores.

### 2. Core Features & Requirements

- **Embedded Shopify App:** Simplified authorization and UI within the Shopify admin.
- **Order Syncing:** Orders from Bubbly are pushed to partner stores via background jobs.
- **Partner Dashboard:** A simple UI showing a table of orders from the last 30 days.
- **Manual Retry for Failed Orders:** Admins manually mark failed orders as "ready_for_sync" to retry syncing.

### 3. Tech Stack

- **Backend:** Express.js with TypeScript
- **Database:** PostgreSQL with Prisma ORM
- **Frontend:** Shopify App Bridge
- **Hosting:** Render
- **Background Jobs:** Bull for job processing
- **Testing:** FactoryBot-like tools for fake data, 80%+ test coverage goal

### 4. Data Models

#### PartnerStore

```ruby
create_table "partner_stores", force: :cascade do |t|
  t.string   "shop_domain",    null: false
  t.string   "access_token",   null: false
  t.string   "status",         null: false  # "active" or "disabled"
  t.datetime "uninstall_date"
  t.datetime "created_at",     null: false
  t.datetime "updated_at",     null: false
  t.index ["shop_domain"], unique: true
end
```

#### OrderSync

```ruby
create_table "order_syncs", force: :cascade do |t|
  t.string   "bubbly_order_id",            null: false
  t.string   "partner_shop_domain",        null: false
  t.string   "partner_order_id"
  t.string   "status",                     null: false  # "pending", "ready_for_sync", "synced", "failed"
  t.string   "error_message"
  t.string   "last_order_failure_reason"
  t.integer  "retry_count",                default: 0, null: false
  t.datetime "last_attempted_at"
  t.datetime "created_at",                 null: false
  t.datetime "updated_at",                 null: false
  t.index ["partner_shop_domain"]
  t.index ["bubbly_order_id"]
end
```

#### ProductMap

```ruby
create_table "product_maps", force: :cascade do |t|
  t.string   "bubbly_product_id",     null: false
  t.string   "partner_shop_domain",   null: false
  t.string   "partner_product_id",    null: false
  t.string   "bubbly_variant_id",     null: false
  t.string   "partner_variant_id",    null: false
  t.datetime "created_at",            null: false
  t.datetime "updated_at",            null: false
  t.index ["partner_shop_domain"]
  t.index ["bubbly_product_id"]
  t.index ["partner_product_id"]
end
```

### 5. Workflows

#### Authentication & Authorization

- **OAuth Flow:** Used during app installation to obtain access tokens.
- **Token Storage:** Tokens stored securely in PostgreSQL.
- **Handling Uninstalls:** Track uninstall date.
- **Permission Changes:** Trigger re-authorization via UI. Failure reason logged as "reauthorization_required."

#### Product Management

- **Automatic Product Sync:** All products synced upon app installation.
- **Product Mapping:** Maintained to track which products and variants belong to which store.
- **No Inventory Sync:** Planned for a future version.

#### Order Processing

1. Customer places an order on Bubbly.
2. Shopify triggers `order_paid` or `order_risk_analyzed` webhook.
3. PowerPact pulls the order details.
4. Analysis determines readiness for syncing.
5. If ready, background job syncs the order.
6. Orders split with simple proration for tax and shipping.
7. Success/failure logged with retry count.
8. Manual retry via status change to "ready_for_sync."

### 6. Background Job Handling

- **Job Queue:** GoodJob for processing (ActiveJob adapter)
- **Job Processing:** Utilize Rails ActiveJob interface
- **Failure Handling:** 
  - Uses Rails' built-in error tracking
  - Exceptions logged to Rails logger
  - Job status tracked in GoodJob dashboard
- **Manual Retry:** Admin interface to retry failed jobs through GoodJob dashboard
- **Job Classes:** Located in `app/jobs` following Rails conventions

### 7. Error Handling

- **Failure Logging:** Include error codes, messages, and timestamps.
- **Retry Mechanism:** None/Manual. Retries tracked with `retry_count`.
- **No Systemic Alerting:** No external monitoring service integration.


### 8. Testing & Staging Strategy

- **Coverage Goal:** 80%+ automated test coverage via SimpleCov
- **Test Framework:** RSpec
- **Test Types:** 
  - Unit tests with RSpec
  - Integration tests with RSpec + VCR
  - Request tests with RSpec 
- **Factory Setup:** FactoryBot for test data generation and Faker
- **API Testing:** 
  - VCR for recording/replaying Shopify API interactions
  - WebMock for stubbing HTTP requests
- **Staging Environment:** Separate Heroku staging environment with dev Shopify stores
- **Fixtures & Factories:** 
  - Located in `spec/factories`
  - Uses Faker for generating realistic test data

### 9. Data Retention

- **Order History:** Maintained indefinitely.
- **No Deletion Policy:** No data deletion after a certain period.

### 10. Future Considerations (Post-MVP)

- Rules-based tax and shipping proration.
- Inventory synchronization.
- Advanced order modification handling.
- Partner notifications for order status.
- Data retention policies.
- Advanced analytics and reporting.
- Automated retry mechanisms.
- Enhanced partner dashboard features.
- Caching layer for product queries.

