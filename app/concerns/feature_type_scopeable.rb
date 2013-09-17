module FeatureTypeScopeable
  extend ActiveSupport::Concern

  module ClassMethods
    def feature_type_scope(feature_type)
      ft_scope = -> { where feature_type: feature_type}
      self.scope feature_type.to_sym, ft_scope
      self.scope feature_type.pluralize.to_sym, ft_scope
    end

    def warm_feature_types!
      Feature.feature_types.each do |feature_type|
        new_scope = feature_type
        begin 
          Feature.feature_type_scope(new_scope)
        rescue
          p "Can't create scope #{new_scope}"
        end
      end
    end
  end
end