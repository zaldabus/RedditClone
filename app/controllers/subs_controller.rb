class SubsController < ApplicationController
  include SubsHelper
  before_filter :authenticate, except: :index

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
    5.times { @sub.links.build }
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.mod_id = current_user.id

    non_empty_links = remove_nil(params[:links].values)
    @sub.links.build(non_empty_links)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      (5 - non_empty_links.count).times { @sub.links.build }
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit
    @sub = Sub.find(params[:id])
    mod_only(@sub)
  end

  def update

    @sub = Sub.find(params[:id])

    @sub.links.each.with_index do |link, i|
      link.update_attributes(params[:links][i.to_s])
    end

    if @sub.update_attributes(params[:sub])
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy

  end
end
