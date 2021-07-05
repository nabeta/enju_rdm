class DatasetsController < ApplicationController
  before_action :set_dataset, only: %i[ show edit update destroy ]
  before_action :check_policy, only: %i[ index new create ]

  # GET /datasets or /datasets.json
  def index
    @datasets = policy_scope(Dataset).page(params[:page])
  end

  # GET /datasets/1 or /datasets/1.json
  def show
  end

  # GET /datasets/new
  def new
    @dataset = Dataset.new
  end

  # GET /datasets/1/edit
  def edit
  end

  # POST /datasets or /datasets.json
  def create
    @dataset = Dataset.new(dataset_params)
    @dataset.user = current_user

    respond_to do |format|
      if @dataset.save
        format.html { redirect_to @dataset, notice: "Dataset was successfully created." }
        format.json { render :show, status: :created, location: @dataset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datasets/1 or /datasets/1.json
  def update
    respond_to do |format|
      if @dataset.update(dataset_params)
        format.html { redirect_to @dataset, notice: "Dataset was successfully updated." }
        format.json { render :show, status: :ok, location: @dataset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dataset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datasets/1 or /datasets/1.json
  def destroy
    @dataset.destroy
    respond_to do |format|
      format.html { redirect_to datasets_url, notice: "Dataset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset
      @dataset = Dataset.find(params[:id])
      authorize @dataset
    end

    def check_policy
      authorize Dataset
    end

    # Only allow a list of trusted parameters through.
    def dataset_params
      params.require(:dataset).permit(:title, :alternative_title, :publisher)
    end
end
