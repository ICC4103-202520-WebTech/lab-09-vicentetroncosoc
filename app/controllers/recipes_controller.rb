class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /recipes
  def index
    # usa la capacidad para filtrar; si ?mine=1, solo las propias (si hay sesión)
    scope = Recipe.accessible_by(current_ability)
    @recipes = if params[:mine].present? && user_signed_in?
                 scope.where(user_id: current_user.id)
               else
                 scope
               end
  end

  # GET /recipes/1
  def show
    # @recipe ya la cargó load_and_authorize_resource
  end

  # GET /recipes/new
  def new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe.user = current_user  # importante: dueño = quien crea
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy!
    redirect_to recipes_path, notice: "Recipe was successfully destroyed.", status: :see_other
  end

  private

  # ¡No permitir :user_id!
  def recipe_params
    params.require(:recipe).permit(:title, :cook_time, :difficulty, :instructions, :image)
  end
end
