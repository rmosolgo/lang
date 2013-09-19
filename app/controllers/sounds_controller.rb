class SoundsController < DataValuesController

  def index
    @sounds = Sound.all

    @consonant_rows = [
      {name: "Nasal", sounds: Sound.nasals.not_coarticulated},
      {name: "Stop", sounds: Sound.stops.not_coarticulated},
      {name: "Sibilant", sounds: Sound.sibilant.fricative},
      {name: "Fricative", sounds: Sound.non_sibilant.non_lateral.fricatives},
      {name: "Approximant", sounds: Sound.approximants.non_lateral.not_coarticulated},
      {name: "Flap or Tap", sounds: Sound.flap.non_lateral},
      {name: "Trill", sounds: Sound.trill},
    ]

    @lateral_rows = [
      {name: "Lateral Fricative", sounds: Sound.lateral.fricative},
      {name: "Lateral Approximant", sounds: Sound.lateral.approximant},
      {name: "Lateral Tap", sounds: Sound.lateral.flap}
    ]
  end

  def show_by_letter
    @sound = Sound.find_by(letter: params[:letter])
    render action: :show
  end

  def show
    @sound = Sound.find(params[:id])
  end

  
end
