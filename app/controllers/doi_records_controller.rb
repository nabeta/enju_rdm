class DoiRecordsController < ApplicationController
  before_action :set_doi_record, only: %i[ show edit update destroy ]
  before_action :check_policy, only: %i[ index new create ]

  # GET /doi_records or /doi_records.json
  def index
    @doi_records = DoiRecord.page(params[:page])
  end

  # GET /doi_records/1 or /doi_records/1.json
  def show
  end

  # GET /doi_records/new
  def new
    @doi_record = DoiRecord.new
  end

  # GET /doi_records/1/edit
  def edit
  end

  # POST /doi_records or /doi_records.json
  def create
    @doi_record = DoiRecord.new(doi_record_params)

    respond_to do |format|
      if @doi_record.save
        format.html { redirect_to @doi_record, notice: "Doi record was successfully created." }
        format.json { render :show, status: :created, location: @doi_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doi_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doi_records/1 or /doi_records/1.json
  def update
    respond_to do |format|
      if @doi_record.update(doi_record_params)
        format.html { redirect_to @doi_record, notice: "Doi record was successfully updated." }
        format.json { render :show, status: :ok, location: @doi_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doi_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doi_records/1 or /doi_records/1.json
  def destroy
    @doi_record.destroy
    respond_to do |format|
      format.html { redirect_to doi_records_url, notice: "Doi record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doi_record
      @doi_record = DoiRecord.find(params[:id])
      authorize @doi_record
    end

    def check_policy
      authorize DoiRecord
    end

    # Only allow a list of trusted parameters through.
    def doi_record_params
      params.require(:doi_record).permit(:identifier, :dataset_id)
    end
end
