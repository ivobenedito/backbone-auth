class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable

  field :title, type: String
  field :body,  type: String  

  embeds_many :comments
  belongs_to :user

  track_history on: [:title, :body]
end