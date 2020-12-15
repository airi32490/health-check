class HealthsController < ApplicationController

  def new
    @health = Health.new
  end

  def create
    @health = Health.new(health_params)
    if @health.body_temperature >= 37.0 || @health.alcohol_level >= 0.15
      @health.save
      redirect_to check_healths_path
    else
      @health.save
      redirect_to top_healths_path
    end
  end

  def check
    @user = User.new
  end

  def approval
    @user = User.find_by(health_checker_params)
    if @user.checker_id == 2
      redirect_to top_healths_path
    else
      render :check
    end
  end

  def top
    @healths = Health.all
  end


  private

  def health_params
    params.require(:health).permit(:body_temperature, :condition_id, :alcohol_level).merge(user_id: current_user.id)
  end

  def health_checker_params
    params.require(:user).permit(:email)
  end
end
