class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :category, :transaction_type, :date, :user
  def user
    { id: object.user.id, email: object.user.email }
  end
end
