class TransactionsController < ApplicationController
  def index
    render json: current_user.transactions.order(date: :desc), each_serializer: TransactionSerializer
  end

  def create
    tx = current_user.transactions.new(tx_params)
    if tx.save
      render json: tx, serializer: TransactionSerializer, status: :created
    else
      render json: { error: tx.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    tx = current_user.transactions.find(params[:id])
    tx.destroy
    head :no_content
  end

  private
  def tx_params
    params.require(:transaction).permit(:amount, :category, :transaction_type, :date)
  end
end
