namespace :ostranslator do

  desc "make some noise"
  task :noise => :environment do
    logger = Logger.new("log/noise.log")
    time=Time.now.to_s
    puts "#{time} - some noise "
    logger.debug("#{time} some noise")


  end

 end

