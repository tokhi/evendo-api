namespace :events do
  desc "This task will sync the events with google movies api "
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
	  event.event_date = Time.now
	  event.seat_nums = Random.rand(15..32)
	  event.location = org[0].address
	  event.category = "N/A"
	  event.rating = Random.rand(2..5)
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
