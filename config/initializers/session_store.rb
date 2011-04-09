# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gardengnome_session',
  :secret      => 'c6753896988b802a6f4c6e16b95e975ac21c3d6933fb93331874ceb62109f856f01f28d49def96771e7188d1cdf4a095b9706d5e1ee13d05083de43d1a0572f6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
