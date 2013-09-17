module FeatureTypeScopeable
  extend ActiveSupport::Concern

  module ClassMethods
    def define_feature_type_scopes(feature_type)
      ft_scope = -> { where feature_type: feature_type}
      
      scope feature_type.to_sym, ft_scope
      scope feature_type.pluralize.to_sym, ft_scope
    end

    def warm_feature_types!
      Feature.feature_types.each do |feature_type|
        Feature.define_feature_type_scopes(feature_type)
      end
    end
    
    def define_feature_name_scope(feature_name)
      define_method feature_name.to_sym do
        Feature.find_by(name: feature_name)
      end
      Feature.find_by(name: feature_name)
    end
    
    def warm_feature_names!
      Feature.find_each do |feature|
        define_feature_name_scope(feature.name)
      end
    end

  end
end