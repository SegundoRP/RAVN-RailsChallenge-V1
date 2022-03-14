class TrainersController < ApplicationController
  before_action :set_trainer, only: [:show, :edit, :update, :destroy]

  def index
    @trainers = User.where("admin = false AND id != ?", current_user.id).paginate(page: params[:page], per_page: 3)

    if params[:search].present?
      if params[:search][:query].empty?
        @trainers = User.where("admin = false AND id != ?", current_user.id).paginate(page: params[:page], per_page: 3)
      else
        sql_query = " \
          first_name iLIKE :query \
          OR last_name iLIKE :query \
          OR email iLIKE :query \
          OR CONCAT(first_name, ' ', last_name) iLIKE :query \
        "
        @trainers = User.where(sql_query, query: "%#{params[:search][:query]}%").where("admin = false AND id != ?", current_user.id).paginate(page: params[:page], per_page: 3)
      end
    end
  end

  def add
    @trainer = User.new
  end

  def show

  end

  def create
    @trainer = User.new(user_params)
    @trainer.pokemons << Pokemon.find(params[:user][:pokemon_id].reject { |c| c.empty? })
    password_user = SecureRandom.uuid
    @trainer.username = "#{user_params[:first_name]}_#{user_params[:last_name]}"
    @trainer.password = password_user
    @trainer.password_confirmation = password_user
    if @trainer.save
      redirect_to trainer_path(@trainer)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @trainer.update(user_params)
      redirect_to trainer_path(@trainer)
    else
      render :edit
    end
  end

  def destroy
    @trainer.destroy
    redirect_to trainers_path
  end

  private

  def set_trainer
    @trainer = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :country, :photo)
  end
end
