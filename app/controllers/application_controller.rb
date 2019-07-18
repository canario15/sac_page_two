class ApplicationController < ActionController::Base

  def close_race
    race = Race.find(params[:id])
    if race.close
      flash[:notice] = 'Carrera cerrada con éxito.'
    else
      flash[:error] = 'La carrera ya fué cerrada.'
    end
  end
end
