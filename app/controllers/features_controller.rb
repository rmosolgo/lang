class FeaturesController < DataValuesController

  def class_params
    params.require(:feature).permit(:name)
  end
  
end
