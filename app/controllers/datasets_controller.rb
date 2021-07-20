class DatasetsController < ApplicationController
  before_action :set_dataset, only: %i[ show edit update destroy ]
  before_action :check_policy, only: %i[ index new create ]

  # GET /datasets or /datasets.json
  def index
    @q = params[:q]
    search_condition = Elasticsearch::DSL::Search.search do
      query do
        bool do
          must do
            query_string do
              query params[:q].blank? ? "*:*" : params[:q]
              fields ['title', 'keyword', 'collection']
              default_operator 'and'
            end

            filter do
              term visibility: "closed"
            end

            sort updated_at: "desc"
          end
        end
      end

      aggregation :keyword_count do
        terms do
          field 'keyword'
          size 20
        end
      end
    end

    search = Dataset.__elasticsearch__.search(search_condition)
    @datasets = search.page(params[:page]).per(10).records
    @dataset_facets = search.aggregations
  end

  # GET /datasets/1 or /datasets/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.zip { send_data @dataset.attachment.download, content_type: 'application/x-zip-compressed' }
    end
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
      dataset = Dataset.find(params[:id])
      if params[:version].present?
        @dataset = dataset.versions.where(event: :update).find(params[:version]).reify
      else
        @dataset = dataset
      end

      authorize @dataset
    end

    def check_policy
      authorize Dataset
    end

    # Only allow a list of trusted parameters through.
    def dataset_params
      params.require(:dataset).permit(:title, :alternative_title, :publisher, :readme)
    end
end
