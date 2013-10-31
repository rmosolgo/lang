class TagsController < DataValuesController
  def show
    @data_value = Tag.find_by(name: params[:id])
    render "data_values/show"
  end
end
