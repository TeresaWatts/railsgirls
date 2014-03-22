class ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render 'index'
  end

  def show
    @listing = Listing.find(params[:id])
    render 'show'
  end

  def new
    @listing = Listing.new
    render 'new'
  end

  def edit
    @listing = Listing.find(params[:id])
    render 'edit'
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def listing_params
    params.require(:listing).permit(:name, :description, :picture)
  end

end
