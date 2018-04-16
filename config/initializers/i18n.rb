I18n.default_locale = :en

require "i18n/backend/fallbacks"
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)


OSDB_TRANSLATIONS_KEYS=["global", "menu", "request", "vajax", "banner", "html", "profile", "upload", "search", "imdblook", "subdetail", "report", "editsub", "stats", "languages", "hint", "msg", "tpl", "player", "comment", "java", "ad"]


$redis = Redis.new(:host => 'localhost', :port => 6379)
$redis.keys.find_all{|k| k.start_with? "i18n"}.each {|k| $redis.del k}

Ostranslator::Application.config.cache_store = :redis_store, $redis.id

I18n::Backend::Simple.send(:include, I18n::Backend::Cache)
I18n.cache_store = ActiveSupport::Cache.lookup_store(:redis_store)
