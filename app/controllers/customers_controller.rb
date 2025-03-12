class CustomersController < ApplicationController
  def edit_customer
  end

  def manage_customer
    if current_admin.update(customer_params)
      flash[:notice] = "Profile updated successfully"
      redirect_to root_path
    else
      flash[:notice] = current_admin.errors.full_messages.join(",")
      redirect_to edit_customer_path
    end
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :username, :email)
  end
end
