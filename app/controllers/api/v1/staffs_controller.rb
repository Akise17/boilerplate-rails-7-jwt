class Api::V1::StaffsController < Api::ApiController
  def index
    @staffs = Staff.all
    render json: @staffs
  end

  def show
    @staff = Staff.includes(:lents).find(params[:id])
    render json: {
      staff: @staff,
      total_lents: @users.total_lents
    }
  end

  def create
    @staff = Staff.new(permitted_params)
    if @staff.save
      render json: @staff, status: :created
    else
      render json: { errors: @staff.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update(permitted_params)
      render json: @staff
    else
      render json: { errors: @staff.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    head :no_content
  end

  def permitted_params
    params.require(:staff)
          .permit(:name,
                  :email,
                  :department
                 )
  end
end
