class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable

  field :title, type: String
  field :body,  type: String

  embeds_many :comments
  belongs_to :user

  track_history on: [:title, :body],
                version_field: :_version,
                track_create: true,
                track_update: true,
                track_destroy: true

end