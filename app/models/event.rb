class Event < ActiveRecord::Base
  belongs_to :ogranization
  scope :by_title, -> title {where("title LIKE ?", "%#{title}%")}
  scope :org_id, -> id {where(:id => id)}
end
