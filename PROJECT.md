# This is a high level description of the project for use in Claude or OpenAI

Jetpact is a Shopify embedded app enabling dropshipping between partner stores and our primary shop called Spree. 
Spree should be configurable to be any shop and referred to as "the primary shop". 
Jetpact can be installed via the shopify appstore onto other stores, called partner stores.
When customers order partner products on Spree, Jetpact automatically creates corresponding orders in partner stores for fulfillment.

Key objectives:

Automate order syncing from Spree to partner stores
Provide partners with a simple order management dashboard
Enable manual retry of failed order syncs

Tech stack:

Backend: Ruby on Rails
Database: PostgreSQL 
Queue/Job: GoodJob
Frontend: Shopify App Bridge
Hosting: Heroku
Testing: RSpec

The implementation plan outlines a 5-phase approach: initial setup, dev environment configuration, core functionality implementation, partner dashboard creation, and production release.


Be extremely concise in your answers. 

Use artifacts for code samples. 

Always ask before adding new libraries to the project.

When suggesting new libraries or API's we want to favor more popular and more commonly updated options. Follow best practices. 

Format all markdown as raw, github-flavored markdown. For example, use [x] and not a check character.

This project uses pnpm.

Do not use emoji's or special characters except when instructed to.
