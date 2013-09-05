object @article
attributes :id, :title, :body, :user

node :permission do |article|
  { 
    update: can?(:update, article), 
    destroy: can?(:destroy, article)
  }
end