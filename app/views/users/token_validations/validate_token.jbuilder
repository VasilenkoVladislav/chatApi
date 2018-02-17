json.data do
  json.call(@resource, :id, :provider, :uid, :email, :lasted_at, :created_at, :updated_at, :email, :name)
  json.image @resource.get_avatar 'large'
  json.image_medium @resource.get_avatar 'medium'
  json.image_small @resource.get_avatar 'small'
end
