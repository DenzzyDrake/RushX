class CoversController < ApplicationController
  before_action :set_cover, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @covers = Cover.all
  end

  def new
    @cover = current_user.covers.build
  end

  def create
    @cover = current_user.covers.build(cover_params)

    if @cover.save
      redirect_to covers_path, notice: "The resume #{@cover.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @cover = Cover.find(params[:id])
    @cover.destroy
    redirect_to covers_path, notice:  "The resume #{@cover.name} has been deleted."
  end

 private

    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @resume = Cover.find(params[:id])
    end

    def correct_user
      @cover = current_user.covers.find_by(id: params[:id])
      redirect_to covers_path, notice: "Not authorized to edit this profile" if @cover.nil?
    end

    def cover_params
     params.require(:cover).permit(:name, :attachment)
   end
end