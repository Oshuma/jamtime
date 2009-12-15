# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jamtime_session',
  :secret      => '0786311641322b54346a20a9f54929bfbbf47ec5baaf2022bdd612d4938d2ed95684a8049949c2b6ee89ea11a98ffdb43145c8d6546edb1be10964aecc441b3b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
