unless Rails.env.development?
  class ForbiddenDBSeedError < StandardError; end
  raise ForbiddenDBSeedError,
        "You should not seed the #{Rails.env} environment database."
end
