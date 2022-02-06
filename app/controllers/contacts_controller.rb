class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /todos
  def index
    # @contacts = Contact.all
    # json_response(@contacts)
    @contacts = current_user.contacts
    json_response(@contacts)
  end

  # POST /todos
  def create
    # @contact = Contact.create!(contact_params)
    # json_response(@contact, :created)
    @contact = current_user.contacts.create!(contact_params)
    json_response(@contact, :created)
  end

  # GET /todos/:id
  def show
    json_response(@contact)
  end

  # PUT /todos/:id
  def update
    @contact.update(contact_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @contact.destroy
    head :no_content
  end

  private

  def contact_params
    # whitelist params
    params.permit(:email, :address, :phone)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
