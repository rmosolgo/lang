class LanguagesController < DataValuesController

  def index
    @langs = Language.paginate(page: params[:page], per_page: 30)
  end

  def show
    @lang = Language.find_by(name: params[:id])
  end
end
