class Event < ActiveRecord::Base
  belongs_to :ogranization
  # include Filterable
  # scope :by_title, -> title {where("title LIKE :term", {:term => "%#{title}%"})}
   scope :by_title, -> title {where("title LIKE ?", "%#{title}%")}
end
