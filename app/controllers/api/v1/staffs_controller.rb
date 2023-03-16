class Api::V1::StaffsController < Api::ApiController
  before_action :set_staff, only: %i[show update destroy]

  def index
    @staffs = Staffs.all

    render json: { data: @staffs }
  end

  def show
    render json: { data: @staff }, status: :ok
  end

  def create
    @staff = Staffs.new(permitted_params)

    if @staff.save
      render json: { data: @staff }, status: :created
    else

      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  def update
    if @staff.update(permitted_params)

      render json: { data: @staff }, status: :ok
    else

      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @staff.destroy
  end

  private

  def set_staff
    @staff = Staffs.find(params[:id])
  end

  def permitted_params
    params.require(:staff).permit(:name, :email, :department)
  end
end
