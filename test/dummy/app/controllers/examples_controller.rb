class ExamplesController < ApplicationController
  before_action :set_example, only: [:show, :edit, :update, :destroy]

  # GET /examples
  def index
    @examples = Example.all
  end

  # GET /examples/1
  def show
  end

  # GET /examples/new
  def new
    @example = Example.new
  end

  # GET /examples/1/edit
  def edit
  end

  # POST /examples
  def create
    @example = Example.new(example_params)

    if @example.save
      redirect_to @example, notice: 'Example was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /examples/1
  def update
    if @example.update(example_params)
      redirect_to @example, notice: 'Example was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /examples/1
  def destroy
    @example.destroy
    redirect_to examples_url, notice: 'Example was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example
      @example = Example.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def example_params
      params.require(:example).permit(:title, :comment)
    end
end
