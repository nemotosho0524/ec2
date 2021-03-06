class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @post = Post.find(params[:post_id])
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show

  end

  # GET /orders/new
  def new
    @post = Post.find(params[:post_id])
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @post = Post.find(params[:post_id])
    @order = Order.new(order_params)
    @order.post_id = @post.id
    @order.user_id = current_user.id
    @order.line_price = @post.price

   if @order.save
      OrderMailer.order_when_create(@order).deliver
      OrderMailer.send_admin(@order).deliver
      redirect_to posts_path
    else
      respond_to do |format|
      format.html { render :new }
      format.json { render json: @post.order.errors, status: :unprocessable_entity }
    end
   end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :post_id, :order_name, :tel, :email, :address)
    end
end
