# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_playtime_session',
  :secret      => '6e0219924abe813a76f8f781302f5a2cab9ef2844188c3c7d13ee0e0c9eb5e503a451323d6ee42146e708219d32eb9326aa925b884fe722e9cb0ce91ece5ba15'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
