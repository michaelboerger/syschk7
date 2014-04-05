class OwnersController < ApplicationController
  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to @owner
      flash[:notice] = "But, if you really think about it, can anyone really OWN a building?"
    else
      render 'new'
    end
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def index
    @owners = Owner.all
  end

  def destroy
    @owner = Owner.find(params[:id])
    @owner.delete
    redirect_to owner_url
  end

  private

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end
end
