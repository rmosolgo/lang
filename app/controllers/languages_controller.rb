class LanguagesController < DataValuesController

  def index
    @langs = Language.paginate(page: params[:page], per_page: 30)
  end

  def show
    @lang = Language.find_by(name: params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @lang }
    end
  end
end
