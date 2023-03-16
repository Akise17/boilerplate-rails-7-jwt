class Api::V1::AssetsController < Api::ApiController
  before_action :set_asset, only: %i[show update destroy lent]

  def index
    @assets = Assets.all

    render json: { data: @assets }
  end

  def show
    render json: { data: @asset }, status: :ok
  end

  def create
    @asset = Assets.new(permitted_params)

    if @asset.save
      render json: { data: @asset }, status: :created
    else

      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  def update
    if @asset.update(permitted_params)

      render json: { data: @asset }, status: :ok
    else

      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @asset.destroy
  end

  def lent
    if @asset.update(staff_id: params[:staff_id])

      render json: { data: @asset }, status: :ok
    else

      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  private

  def set_asset
    @asset = Assets.find(params[:id])
  end

  def permitted_params
    params.require(:asset).permit(:name, :description, :types, :serial_number, :status, :staff_id)
  end
end
