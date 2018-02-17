json.users do
  json.array!(@users.records) do |user|
    json.call(user, :id, :name)
    json.image user.get_avatar 'large'
    json.image_medium user.get_avatar 'medium'
    json.image_small user.get_avatar 'small'
  end
end
