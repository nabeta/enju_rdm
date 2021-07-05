class FilesetsController < ApplicationController
  before_action :set_fileset, only: %i[ show edit update destroy ]
  before_action :check_policy, only: %i[ index new create ]

  # GET /filesets or /filesets.json
  def index
    authorize Fileset
    @filesets = policy_scope(Fileset).page(params[:page])
  end

  # GET /filesets/1 or /filesets/1.json
  def show
  end

  # GET /filesets/new
  def new
    authorize Fileset
    @dataset = Dataset.find_by(id: params[:dataset_id])
    @fileset = Fileset.new(dataset: @dataset)
  end

  # GET /filesets/1/edit
  def edit
  end

  # POST /filesets or /filesets.json
  def create
    authorize Fileset
    @fileset = Fileset.new(fileset_params)

    respond_to do |format|
      if @fileset.save
        format.html { redirect_to @fileset, notice: "Fileset was successfully created." }
        format.json { render :show, status: :created, location: @fileset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fileset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filesets/1 or /filesets/1.json
  def update
    respond_to do |format|
      if @fileset.update(fileset_params)
        format.html { redirect_to @fileset, notice: "Fileset was successfully updated." }
        format.json { render :show, status: :ok, location: @fileset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fileset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filesets/1 or /filesets/1.json
  def destroy
    @fileset.destroy
    respond_to do |format|
      format.html { redirect_to filesets_url, notice: "Fileset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fileset
      @fileset = Fileset.find(params[:id])
      authorize @fileset
    end

    def check_policy
      authorize Fileset
    end

    # Only allow a list of trusted parameters through.
    def fileset_params
      params.require(:fileset).permit(:dataset_id, :attachment)
    end
end
