# PowerPact Technical Implementation Plan

## Phase 1: Initial Setup

### Project Initialization
- [x] Create new Rails 7 project with PostgreSQL
- [x] Add RSpec for testing
- [x] Add SimpleCov, VCR, and Faker gems
- [x] Configure RuboCop and Prettier
- [x] Create first passing test
- [x] Success Criteria: Server returns "Hello World" on / with passing test

### Database Setup
- [x] Configure PostgreSQL connection
- [x] Create initial migration for PartnerStore model
- [x] Set up database.yml for different environments
- [x] Add FactoryBot and first factory
- [x] Write basic model specs
- [x] Success Criteria: Test connects to DB and creates/reads a PartnerStore

### Queue Setup
- [x] Configure GoodJob
- [x] Create sample background job
- [x] Write job specs
- [x] Success Criteria: Job processed and logged

## Phase 2: Development Environment

### Heroku Setup
- [x] Create Heroku account
- [x] Set up staging environment
- [x] Configure PostgreSQL on Heroku
- [x] Set up CI/CD pipeline
- [x] Success Criteria: Automated deploys on main branch merge

### Shopify Development Stores
- [x] Create Spree development store
- [x] Create two partner development stores
- [x] Configure basic products in partner stores
- [x] Success Criteria: All stores accessible and configured

## Phase 3: Core Implementation

### Data Models
- [x] Implement ProductMap model
- [x] Implement OrderSync model
- [x] Add model relationships and validations
- [x] Create migrations
- [x] Add FactoryBot factories for each model
- [x] Add model specs
- [x] Success Criteria: All models created with passing specs

### Shopify Integration
- [ ] Add shopify_api gem
- [ ] Implement store authentication
- [ ] Add product fetching service
- [ ] Add order creation service
- [ ] Write integration specs with VCR
- [ ] Success Criteria: Can fetch products and create orders via API

### Product Sync
- [ ] Implement product fetch service
- [ ] Add product mapping service
- [ ] Create products in Spree store
- [ ] Add sync status tracking
- [ ] Write end-to-end specs
- [ ] Success Criteria: Products sync from partner to Spree

### Order Processing
- [ ] Create OrderProcessorJob
- [ ] Implement order splitting service
- [ ] Add order creation in partner stores
- [ ] Implement error handling
- [ ] Add retry mechanism
- [ ] Write job specs
- [ ] Success Criteria: Orders split and created in partner stores

## Phase 4: Partner Dashboard

### Basic UI
- [ ] Set up Shopify App Bridge with Rails views
- [ ] Create order list view
- [ ] Add error display
- [ ] Implement manual retry
- [ ] Success Criteria: Partners can view and retry orders

## Phase 5: Production Release

### Security & Monitoring
- [ ] Configure Rails logging
- [ ] Set up error tracking (Sentry/Honeybadger)
- [ ] Add performance monitoring (Scout/NewRelic)
- [ ] Configure backup strategy
- [ ] Success Criteria: Production-ready monitoring in place

### Production Deploy
- [ ] Set up production environment on Heroku
- [ ] Configure production databases
- [ ] Add production secrets
- [ ] Perform security audit
- [ ] Success Criteria: Production environment ready

### App Store Release
- [ ] Prepare app listing
- [ ] Create documentation
- [ ] Submit for review
- [ ] Success Criteria: App approved and listed

## Testing Strategy
- Each task should include relevant specs
- Maintain 80%+ coverage using SimpleCov
- Integration specs should use VCR for Shopify API
- System specs should use development stores
- Use FactoryBot for test data
- Use Faker for test data generation

## Followups
- [ ] will PartnerStores#access_token initially be false? I'd like to add a not null constraint in the db
- [x] Need a procfile for heroku
