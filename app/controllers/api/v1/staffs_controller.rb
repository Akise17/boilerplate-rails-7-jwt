class Api::V1::StaffsController < ApplicationController
    def index
        @staffs = Staff.all

        #to show only the staffs data
        render json: @staffs

        #to show lend data when listing all staff
        #render json: @staffs.to_json(include: {lends: {only: [:id,:asset_id,:lend_status]}})
    end

    def show
      @staff = Staff.find(params[:id])
      @lends = @staff.lends.includes([:staff,:asset])
      @count = {number_of_asset_borrowed: @staff.lends.count}
      render json: [@staff, @count,
                    @lends.as_json(except: [:asset_id,:staff_id], include: {asset: {only: [:id, :name, :asset_type]}})
                    ]
    end
  
    def create
      @staff = Staff.new(staff_params)
  
      if @staff.save
        render json: @staff, status: :created
      else
        render json: @staff.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @staff = Staff.find(params[:id])
  
      if @staff.update(staff_params)
        render json: @staff
      else
        render json: @staff.errors, status: :unprocessable_entity
      end
    end

    def destroy 
      @staff = Staff.find(params[:id])
      @staff.destroy
    end

    private

    def staff_params
      params.require(:staff).permit(:name, :email, :department)
    end
end
