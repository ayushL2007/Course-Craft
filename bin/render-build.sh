#!/usr/bin/env bash
# Exit on any error
set -e

# Run migrations (this will create tables if DB is empty)
bundle exec rails db:migrate

# Optional: Run seeds only if needed (e.g., for first deploy)
# bundle exec rails db:seed

# Precompile assets (required for production)
bundle exec rails assets:precompile