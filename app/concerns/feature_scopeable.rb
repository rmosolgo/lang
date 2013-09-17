module FeatureScopeable
  extend ActiveSupport::Concern

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

    def warm_features!
      Feature.find_each do |feature|
        new_scope = feature.name
        begin
          Sound.feature_scope(new_scope)
        rescue
          raise "Can't create scope #{new_scope}"
        end
      end
    end
  end
end