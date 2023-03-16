class Api::V1::AssetsController < Api::ApiController
  def index
    @assets = Asset.all
    render json: @assets
  end

  def show
    @asset = Asset.find(params[:id])
    render json: @asset
  end

  def create
    @asset = Asset.new(permitted_params)
    if @asset.save
      render json: @asset, status: :created
    else
      render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @asset = Asset.find(params[:id])
    if @asset.update(permitted_params)
      render json: @asset
    else
      render json: { errors: @asset.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    head :no_content
  end

  def permitted_params
    params.require(:asset)
          .permit(:name,
                  :description,
                  :type,
                  :serial_number,
                  :status
                 )
  end
  
end
