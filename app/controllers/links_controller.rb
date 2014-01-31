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
    @link = Link.find(params[:id])
    @subs = Sub.all
  end

  def update
    @link = current_user.links.find(params[:id])
    submitted_user_only(@link)

    if @link.update_attributes(params[:link])
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      @subs = Sub.all
      render :edit
    end
  end

end
