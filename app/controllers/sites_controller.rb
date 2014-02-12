class SitesController < ApplicationController
  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new(params[:site])
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to @site
    else
      render :new
    end
  end

  def redirect
    @site = Site.find_by(token: params[:token])
    if @site
      redirect_to @site.url
    else
      redirect_to root_path
    end
  end

  private
  def site_params
    params.require(:site).permit(:url)
  end
end
