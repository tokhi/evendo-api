namespace :events do
  desc "This task will "
  task sync: :environment do
    client = GoogleMovies::Client.new("berlin")
    client.movies_theaters.each do |theater|
      org =  Organization.where(name: theater.name)
      if org.empty?
        organization = Organization.create(name: theater.name, address: theater.address)
      end
      theater.movies.each do |movie|
        event = Event.where(title: movie.name.encode('iso-8859-1').encode('utf-8'))
        if event.empty?
          event = Event.new
          event.title = movie.name.encode('iso-8859-1').encode('utf-8')
          Rails.logger.info "~> #{event.title} "
          Rails.logger.flush
          event.description = movie.information.encode('iso-8859-1').encode('utf-8')
          event.custom_fields = {"TimeSchedual" => movie.times}
	  event.ogranization_id = org[0].id
          event.details
          event.save
        end
      end # theater
    end # client
  end # task
end # namespace
