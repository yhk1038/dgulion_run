class CommenderController < ApplicationController
  def service_input
  end

  def service_save
    x = Service.new
    x.desc_short  = params[:desc_short]
    x.logo_url    = params[:logo_url]
    x.name        = params[:name]
    x.link_url    = params[:link_url]
    x.desc_long   = params[:desc_long]
    x.is_live     = params[:is_live]
    x.save
    
    redirect_to '/commender/service_input'
  end

  def service_delete
    x = Service.find(params[:id])
    x.destroy
    
    redirect_to '/commender/service_input'
  end

  def service_modify
    @t = Service.find(params[:id])
  end

  def service_update
    x = Service.find(params[:id])
    x.desc_short  = params[:desc_short]
    x.logo_url    = params[:logo_url]
    x.name        = params[:name]
    x.link_url    = params[:link_url]
    x.desc_long   = params[:desc_long]
    x.is_live     = params[:is_live]
    x.save
    
    redirect_to '/commender/service_input'
  end
end
