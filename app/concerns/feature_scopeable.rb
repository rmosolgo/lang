module FeatureScopeable

  raise "Put these in two Modules, and build your scopes when included"
  # Feature.feature_types.each do |feature_type|
  #   new_scope = feature_type

  #   begin 
  #     Feature.send(new_scope)
  #   rescue
  #     p "Can't create scope #{new_scope}"
  #   end
  # end

  extend ActiveSupport::Concern

  included do
    Feature.find_each do |feature|
      new_scope = feature.name

      begin
        Sound.send(new_scope)
      rescue
        p "Can't create scope #{new_scope}"
      end
    end
  end

  module ClassMethods
    def feature_scope(feature_name)    
      new_scope = -> { where("id in (
            select sound_id 
            from features_sounds
            left join features on features.id = feature_id
            where features.name = ?) ", feature_name) }
      self.scope feature_name.to_sym, new_scope
      self.scope feature_name.pluralize.to_sym, new_scope
    end
  end

end