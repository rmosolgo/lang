
scopes = []

Feature.feature_types.each do |feature_type|
  new_scope = feature_type

  begin 
    Feature.send(new_scope)
    scopes << new_scope
  rescue
    p "Can't create scope #{new_scope}"
  end
end

Feature.find_each do |feature|
  new_scope = feature.name

  begin
    Sound.send(new_scope)
    scopes << new_scope
  rescue
    p "Can't create scope #{new_scope}"
  end
end

p "Created scopes: #{scopes.sort.join(", ")}"
