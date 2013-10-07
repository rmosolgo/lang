module FeatureScopeable
  extend ActiveSupport::Concern

  module ClassMethods
    def define_feature_scopes(feature_name)
      local_key = self.name == "Sound" ? "id" : "sound_id"
      new_scope = -> {
            includes(:features).where(
            "#{table_name}.#{local_key} in (
            select sound_id
            from feature_sounds
            left join features on features.id = feature_id
            where features.name = ?) ",
            feature_name).references(:features)
         }
      new_antiscope = -> {
        where("#{table_name}.#{local_key} not in(
          select sound_id
          from feature_sounds
          left join features on features.id = feature_id
          where features.name = ?)", feature_name)
         }

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
          self.define_feature_scopes(new_scope)
        end
      end
    end
  end
end
