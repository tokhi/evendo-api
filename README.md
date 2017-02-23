# Evendo API
<hr/>
This api will run a background job every 30 min to ping google movies and store nearby movie screening.

Using this api its possible to see the movie screening details near to a specific location.

GET /events

```json
[
{

    "id": 1,
    "ogranization_id": 1,
    "title": "Spectre",
    "event_date": null,
    "location": null,
    "seat_nums": null,
    "price": null,
    "description": "2hr 28min - Rated Freigegeben ab 12 Jahren",
    "custom_fields": "{\"TimeSchedual\"=>[\"17:15 \", \"20:30 \", \"22:30\"]}",
    "created_at": "2015-11-14T00:48:10.154Z",
    "updated_at": "2015-11-14T00:48:10.154Z",
    "category": null,
    "thumbnail": "https://i.ytimg.com/vi/z4UDNzXD3qA/mqdefault.jpg",
    "link": "https://www.youtube.com/watch?v=z4UDNzXD3qA",
    "rating": null

},
{

    "id": 2,
    "ogranization_id": 1,
    "title": "Hotel Transsilvanien 2",
    "event_date": null,
    "location": null,
    "seat_nums": null,
    "price": null,
    "description": "1hr 30min - Rated Freigegeben ab 6 Jahren",
    "custom_fields": "{\"TimeSchedual\"=>[\"14:00 \", \"16:00\"]}",
    "created_at": "2015-11-14T00:48:11.325Z",
    "updated_at": "2015-11-14T00:48:11.325Z",
    "category": null,
    "thumbnail": "https://i.ytimg.com/vi/RCqD2w3lJpg/mqdefault.jpg",
    "link": "https://www.youtube.com/watch?v=RCqD2w3lJpg",
    "rating": null

}
]
```
You can change the location:

```ruby
# lib/tasks/events.rake
client = GoogleMovies::Client.new("berlin")
```

You can also modify the sync interval in the `scheduler`

```ruby
# config/initializers/scheduler.rb
require 'rake'
require 'rufus-scheduler'

s = Rufus::Scheduler.singleton
Rake.load_rakefile Rails.root.join( 'Rakefile' )

s.every '30m' do

  Rails.logger.info "event sync #{Time.now}"
  Rails.logger.flush
  Rake::Task['events:sync'].invoke
end

```
### API routes

```bash
 Prefix Verb   URI Pattern                     Controller#Action
       events GET    /events(.:format)               events#index
              POST   /events(.:format)               events#create
        event GET    /events/:id(.:format)           events#show
              PATCH  /events/:id(.:format)           events#update
              PUT    /events/:id(.:format)           events#update
              DELETE /events/:id(.:format)           events#destroy
organizations GET    /organizations(.:format)        organizations#index
              POST   /organizations(.:format)        organizations#create
 organization GET    /organizations/:id(.:format)    organizations#show
              PATCH  /organizations/:id(.:format)    organizations#update
              PUT    /organizations/:id(.:format)    organizations#update
              DELETE /organizations/:id(.:format)    organizations#destroy
```


## Development Environment
to run the api from a vagrant box

```
bin/rais s -b <VAGRANT_BOX_IP>
```


## Production Environment


## Testing Environment
