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

OsdbLanguage.create(id_sub_language:'alb', iso_639:'sq', language_code:'sq' , language_name:'Albanian')
OsdbLanguage.create(id_sub_language:'ara', iso_639:'ar', language_code:'ar' , language_name:'Arabic')
OsdbLanguage.create(id_sub_language:'ast', iso_639:'at', language_code:'at' , language_name:'Asturian')
OsdbLanguage.create(id_sub_language:'baq', iso_639:'eu', language_code:'eu' , language_name:'Basque')
OsdbLanguage.create(id_sub_language:'bre', iso_639:'br', language_code:'br' , language_name:'Breton')
OsdbLanguage.create(id_sub_language:'bul', iso_639:'bg', language_code:'bg' , language_name:'Bulgarian')
OsdbLanguage.create(id_sub_language:'cat', iso_639:'ca', language_code:'ca' , language_name:'Catalan')
OsdbLanguage.create(id_sub_language:'chi', iso_639:'zh', language_code:'zh-CN' , language_name:'Chinese (simplified)')
OsdbLanguage.create(id_sub_language:'cze', iso_639:'cs', language_code:'cs' , language_name:'Czech')
OsdbLanguage.create(id_sub_language:'dan', iso_639:'da', language_code:'da' , language_name:'Danish')
OsdbLanguage.create(id_sub_language:'dut', iso_639:'nl', language_code:'nl' , language_name:'Dutch')
OsdbLanguage.create(id_sub_language:'eng', iso_639:'en', language_code:'en' , language_name:'English')
OsdbLanguage.create(id_sub_language:'epo', iso_639:'eo', language_code:'eo' , language_name:'Esperanto')
OsdbLanguage.create(id_sub_language:'est', iso_639:'et', language_code:'et' , language_name:'Estonian')
OsdbLanguage.create(id_sub_language:'fin', iso_639:'fi', language_code:'fi' , language_name:'Finnish')
OsdbLanguage.create(id_sub_language:'fre', iso_639:'fr', language_code:'fr' , language_name:'French')
OsdbLanguage.create(id_sub_language:'geo', iso_639:'ka', language_code:'ka' , language_name:'Georgian')
OsdbLanguage.create(id_sub_language:'ger', iso_639:'de', language_code:'de' , language_name:'German')
OsdbLanguage.create(id_sub_language:'glg', iso_639:'gl', language_code:'gl' , language_name:'Galician')
OsdbLanguage.create(id_sub_language:'ell', iso_639:'el', language_code:'el' , language_name:'Greek')
OsdbLanguage.create(id_sub_language:'heb', iso_639:'he', language_code:'he' , language_name:'Hebrew')
OsdbLanguage.create(id_sub_language:'hin', iso_639:'hi', language_code:'hi' , language_name:'Hindi')
OsdbLanguage.create(id_sub_language:'hrv', iso_639:'hr', language_code:'hr' , language_name:'Croatian')
OsdbLanguage.create(id_sub_language:'hun', iso_639:'hu', language_code:'hu' , language_name:'Hungarian')
OsdbLanguage.create(id_sub_language:'ice', iso_639:'is', language_code:'is' , language_name:'Icelandic')
OsdbLanguage.create(id_sub_language:'ind', iso_639:'id', language_code:'id' , language_name:'Indonesian')
OsdbLanguage.create(id_sub_language:'ita', iso_639:'it', language_code:'it' , language_name:'Italian')
OsdbLanguage.create(id_sub_language:'jpn', iso_639:'ja', language_code:'ja' , language_name:'Japanese')
OsdbLanguage.create(id_sub_language:'khm', iso_639:'km', language_code:'km' , language_name:'Khmer')
OsdbLanguage.create(id_sub_language:'kor', iso_639:'ko', language_code:'ko' , language_name:'Korean')
OsdbLanguage.create(id_sub_language:'mac', iso_639:'mk', language_code:'mk' , language_name:'Macedonian')
OsdbLanguage.create(id_sub_language:'may', iso_639:'ms', language_code:'ms' , language_name:'Malay')
OsdbLanguage.create(id_sub_language:'nor', iso_639:'no', language_code:'no' , language_name:'Norwegian')
OsdbLanguage.create(id_sub_language:'oci', iso_639:'oc', language_code:'oc' , language_name:'Occitan')
OsdbLanguage.create(id_sub_language:'per', iso_639:'fa', language_code:'fa' , language_name:'Persian')
OsdbLanguage.create(id_sub_language:'pol', iso_639:'pl', language_code:'pl' , language_name:'Polish')
OsdbLanguage.create(id_sub_language:'por', iso_639:'pt', language_code:'pt-PT' , language_name:'Portuguese')
OsdbLanguage.create(id_sub_language:'rus', iso_639:'ru', language_code:'ru' , language_name:'Russian')
OsdbLanguage.create(id_sub_language:'scc', iso_639:'sr', language_code:'sr' , language_name:'Serbian')
OsdbLanguage.create(id_sub_language:'sin', iso_639:'si', language_code:'si' , language_name:'Sinhalese')
OsdbLanguage.create(id_sub_language:'slo', iso_639:'sk', language_code:'sk' , language_name:'Slovak')
OsdbLanguage.create(id_sub_language:'slv', iso_639:'sl', language_code:'sl' , language_name:'Slovenian')
OsdbLanguage.create(id_sub_language:'spa', iso_639:'es', language_code:'es' , language_name:'Spanish')
OsdbLanguage.create(id_sub_language:'swe', iso_639:'sv', language_code:'sv' , language_name:'Swedish')
OsdbLanguage.create(id_sub_language:'tgl', iso_639:'tl', language_code:'tl' , language_name:'Tagalog')
OsdbLanguage.create(id_sub_language:'tha', iso_639:'th', language_code:'th' , language_name:'Thai')
OsdbLanguage.create(id_sub_language:'tur', iso_639:'tr', language_code:'tr' , language_name:'Turkish')
OsdbLanguage.create(id_sub_language:'ukr', iso_639:'uk', language_code:'uk' , language_name:'Ukrainian')
OsdbLanguage.create(id_sub_language:'uzb', iso_639:'uz', language_code:'uz' , language_name:'Uzbek')
OsdbLanguage.create(id_sub_language:'vie', iso_639:'vi', language_code:'vi' , language_name:'Vietnamese')
OsdbLanguage.create(id_sub_language:'rum', iso_639:'ro', language_code:'ro' , language_name:'Romanian')
OsdbLanguage.create(id_sub_language:'pob', iso_639:'pb', language_code:'pt-BR' , language_name:'Portuguese (Brazilian)')
OsdbLanguage.create(id_sub_language:'zht', iso_639:'zt', language_code:'zh-TW' , language_name:'Chinese (traditional)')