
# Which authentication function to use (ie. :authenticate_user!)? When set to
# `nil` will let everyone in.
Lit.authentication_function = :authenticate_user!

# Which authentication verification function to use (ie. :user_signed_in)?
# This is used together with frontend translation module to determine, if
# helper button should be applied and translations wrapped in custom span
Lit.authentication_verification = nil

# Either 'redis' or 'hash'. Hash is the fastest, but will fail in multiprocess
# environment
Lit.key_value_engine = 'redis'
#Lit.redis_hash={:host => 'localhost', :port => 6379,:db=>0}

# Pass extra options to key_value_neinge, ie. prefix for redis (only one
# supported at the moment)
# Lit.storage_options = { prefix: "my_project" }

# If true all translations are returned as html_safe strings
Lit.all_translations_are_html_safe = true

# Translations without default will be humanized (default string will be added)
# ie. scope.page_header will become "Page header"
# If `false` then will serve nil instead (but translation will be wrapped in
# <span title="translation missing string"></span>
Lit.humanize_key = false

# If set to `true` will always parse yaml files upon startup and update cache
# values with ones with yaml - but only, if those keys haven't been changed via
# web ui before
Lit.ignore_yaml_on_startup = true

# API enabled? API allows third party browsing your translations, as well as
# synchronizing them between environments
Lit.api_enabled = false

# API key is required to authorize third party, if API is enabled
Lit.api_key = 'TnaZ4oAIVk51spg8zRXIon7qTz6lWf/723N4H4g4At0='

# If true, last_updated_at column of synchronizaton source will be set to now
# upon record creation
Lit.set_last_updated_at_upon_creation = true

# Store request info - this will store in cache additional info about request
# path that triggered translation key to be displayed / accessed
# For more infor please check README.md
Lit.store_request_info = false

# Initialize lit
Lit.init

