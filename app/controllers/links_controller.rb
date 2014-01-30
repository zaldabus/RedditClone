class LinksController < ApplicationController
  def new
    @link = Link.new
    @subs = Sub.all
  end

  def create
    @link = current_user.links.new(params[:link])

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit

  end

  def update

  end

end
