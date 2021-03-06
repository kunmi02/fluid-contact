class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  def index
    @contacts = current_user.contacts
    json_response(@contacts)
  end

  # POST /contacts
  def create
    @contact = current_user.contacts.create!(contact_params)
    json_response(@contact, :created)
  end

  # GET /contacts/:id
  def show
    json_response(@contact)
  end

  # PUT /contacts/:id
  def update
    @contact.update(contact_params)
    head :no_content
  end

  # DELETE /contacts/:id
  def destroy
    @contact.destroy
    head :no_content
  end

  def star_contact
    @contact.update('starred=?', params[:star])
  end

  def starred
    @starred_contact = current_user.contacts.where('starred=?', true)
    json_response(@starred_contact)
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
