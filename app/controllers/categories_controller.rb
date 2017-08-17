class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
#   def index
#     @categories = Category.all
#   end

#   # GET /categories/1
#   # GET /categories/1.json
#   def show
#     @posts = Post.joins(:category).where(:posts => { :category_id => @category.id })
#   end

#   # GET /categories/new
#   def new
#     @category = Category.new
#   end

#   # GET /categories/1/edit
#   def edit
#   end

#   # POST /categories
#   # POST /categories.json
#   def create
#     @category = Category.new(category_params)

#     respond_to do |format|
#       if @category.save
#         format.html { redirect_to @category, notice: 'Category was successfully created.' }
#       else
#         format.html { render :new }
#       end
#     end
#   end




#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_category
#       @category = Category.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def category_params
#       params.require(:category).permit(:name)
#     end
# end
