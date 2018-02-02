unless Rails.env.development?
  class ForbiddenDBSeedError < StandardError; end
  raise ForbiddenDBSeedError,
        "You should not seed the #{Rails.env} environment database."
end

DEVELOPMENT_PASSWORD = 'Yabo::143'

# the production environment as this file (wich contains clear text passwords)
# is available at the Git repository.
User.create!([
               {
                 # Admin
                 # E-mail doesn't have to be valid as no e-mails are sent
                 # in the development environment (we're using Letter Opener)
                 email: 'julien.ramel@gmail.com',
                 password: DEVELOPMENT_PASSWORD,
                 password_confirmation: DEVELOPMENT_PASSWORD,
                 role: :admin,
                 first_name: 'Admin',
                 last_name: 'User',
                 # Required when using Devise's Confirmable module
                 confirmed_at: Time.zone.today,
               }, {
                 # Ordinary user (non-admin)
                 email: 'julien@yabo-concept.ch',
                 password: DEVELOPMENT_PASSWORD,
                 password_confirmation: DEVELOPMENT_PASSWORD,
                 role: :user,
                 first_name: 'Ordinary',
                 last_name: 'User',
                 confirmed_at: Time.zone.today,
               }
             ])
