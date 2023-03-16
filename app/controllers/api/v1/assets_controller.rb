class Api::V1::AssetsController < ApplicationController
    def index
        @assets = Asset.all
        render json: @assets
    end

    def show
      @asset = Asset.find(params[:id])
      render json: @asset
    end
  
    def create
      @asset = Asset.new(asset_params)
  
      if @asset.save
        render json: @asset, status: :created
      else
        render json: @asset.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @asset = Asset.find(params[:id])
  
      if @asset.update(asset_params)
        render json: @asset
      else
        render json: @asset.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @asset = Asset.find(params[:id])
      @asset.destroy
    end

    private

    def asset_params
      params.require(:asset).permit(:name, :description, :asset_type, :serial_number, :status)
    end
end
