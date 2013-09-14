class SoundsController < DataValuesController

  def class_params
    params.require(:sound).permit(:letter)
  end
  
end
