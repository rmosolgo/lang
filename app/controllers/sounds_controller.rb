class SoundsController < DataValuesController

  def index
    @sounds = Sound.all
  end

  def show
    if params[:id] =~ /\d+/
      @sound = Sound.find(params[:id])
    else
      @sound = Sound.find_by(letter: params[:id])
    end
  end


end
