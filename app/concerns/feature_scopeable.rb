module FeatureScopeable
  extend ActiveSupport::Concern

  module ClassMethods
    def define_feature_scopes(feature_name)
      new_scope = -> { where("id in (
            select sound_id
            from features_sounds
            left join features on features.id = feature_id
            where features.name = ?) ", feature_name) }
      new_antiscope = -> {
        where("id not in(
          select sound_id
          from features_sounds
          left join features on features.id = feature_id
          where features.name = ?)", feature_name)}

      scope feature_name.to_sym, new_scope
      scope feature_name.pluralize.to_sym, new_scope
      scope "not_#{feature_name}".to_sym, new_antiscope
      scope "non_#{feature_name}".to_sym, new_antiscope
      scope "non_#{feature_name.pluralize}".to_sym, new_antiscope
      scope "not_#{feature_name.pluralize}".to_sym, new_antiscope
      define_method("#{feature_name}?") do
        features.where(name: feature_name).count > 0
      end
      define_method("not_#{feature_name}?") do
        features.where(name: feature_name).count == 0
      end
    end

    def warm_features!
      Feature.find_each do |feature|
        new_scope = feature.name
        begin
          Sound.define_feature_scopes(new_scope)
        rescue
          raise "Can't create scope #{new_scope}"
        end
      end
    end
  end
end
