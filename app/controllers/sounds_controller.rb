class SoundsController < DataValuesController
  def index
    @sounds = Sound.all
    respond_to do |format|
      format.html
      format.json { render json: @sounds }
    end
  end

  def show
    if params[:id] =~ /\d+/
      @sound = Sound.find(params[:id])
    else
      @sound = Sound.find_by(letter: params[:id])
    end
    respond_to do |format|
      format.html
      format.json { render json: @sound }
    end
  end
end
