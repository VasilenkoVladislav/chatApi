json.call(@resource, :id, :provider, :uid, :email, :lasted_at, :created_at, :updated_at, :email, :name)
json.image @resource.get_avatar 'large'
json.image_medium @resource.get_avatar 'medium'
json.image_small @resource.get_avatar 'small'
json.created_at @resource[:created_at].to_i
json.updated_at @resource[:updated_at].to_i
json.lasted_at @resource[:lasted_at].to_i
