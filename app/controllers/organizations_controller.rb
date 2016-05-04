class OrganizationsController < ApplicationController
  load_and_authorize_resource
  before_action :find_organization, only: [:show, :edit, :destroy, :update]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organizations_path
    else
      flash[:notice] = "Organization WAS NOT added."
      render :new
    end
  end

  def edit
  end

  def update
    if params[:organization][:remove_logo] == '1'
      @organization.remove_logo!
    end

    if @organization.update(organization_params)
      redirect_to organizations_path
    else
      flash[:notice] = 'Organization WAS NOT updated.'
      render :edit
    end
  end

  def destroy
    if @organization.destroy
      redirect_to organizations_path
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :about, :mission, :vision, :logo, :logo_cache)
  end

  def find_organization
    @organization = Organization.find params[:id]
  end
end
