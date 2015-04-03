class PokemonsController < ApplicationController

  def capture
    @pokemon_capture = Pokemon.find(params[:id])
    @pokemon_capture.trainer_id = current_trainer.id
    @pokemon_capture.save!
    redirect_to root_path
  end

  def kill
    @pokemon_kill = Pokemon.find(params[:id])
    @pokemon_kill.health -= 10
    if @pokemon_kill.health <= 0
  	  @pokemon_kill.destroy
  	else
  	  @pokemon_kill.save!
  	end
  	redirect_to trainer_path(id: current_trainer.id)
  end

  def new
  	@pokemon = Pokemon.new()
  end

  def create
  	@pokemon = params[:pokemon]
  	@name = @pokemon["name"]
  	@error = Pokemon.create(:name => @name, :level => 1, :health => 100, :trainer_id => current_trainer.id)
  	if (@error.errors.full_messages.to_sentence.empty?)
      redirect_to trainer_path(id: current_trainer.id)
    else
      flash[:error] = @error.errors.full_messages.to_sentence
      redirect_to new_path
    end
  end

end
