require 'rake'
require 'rufus-scheduler'

s = Rufus::Scheduler.singleton
Rake.load_rakefile Rails.root.join( 'Rakefile' )

s.every '30m' do

  Rails.logger.info "event sync #{Time.now}"
  Rails.logger.flush
  Rake::Task['events:sync'].invoke
end
