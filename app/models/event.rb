class Event < ActiveRecord::Base
  belongs_to :ogranization
  scope :by_title, -> title {where("title LIKE ?", "%#{title}%")}
end
