class FeaturesController < DataValuesController

  def index
    @feature_types = Feature.feature_types
    @features = Feature.all
  end

  def show_by_name
    feature = Feature.find_by(name: params[:feature_name])
    params[:id] = feature.id
    show
  end

end
