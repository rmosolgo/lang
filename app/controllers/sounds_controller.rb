class SoundsController < DataValuesController

  def index
    @sounds = Sound.all
  end

  def show_by_letter
    sound = Sound.find_by(letter: params[:letter])
    params[:id] = sound.id
    show
  end

  
end
