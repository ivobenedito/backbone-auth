class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :message, type: String

  embedded_in :article
end