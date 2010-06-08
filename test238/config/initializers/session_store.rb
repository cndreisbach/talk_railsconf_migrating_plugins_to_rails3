# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_test238_session',
  :secret      => '4638dca9f7c6ebf2372979bceb99355e337275150f6fc069fdf2258d38d3cb61a34efcc12447861cd6762fdca4fd66a01e37bce4cac89adc6b047f6bf0226956'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
