require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) {create(:user)}

  describe 'GET #index' do
    context 'in the case of user_signed_in' do
      before do
        login_user user
      end

      it "assigns the requested group to @group" do
      end

      it "assigns the requested message to @message" do
      end

      it "render is the :index template" do
      end
    end

    context 'in the case of not user_signed_in' do
      it "redirects to devise/registrations#new" do
      end
    end
  end

  describe 'POST #create' do
    context 'in the case of user_signed_in & saves the message in the database' do
      before do
        login_user user
      end

      it 'saves the new messages in the database' do
      end

      it 'redirects to messages#index' do
      end
    end

    context 'in the case of user_signed_in & could not save the massage in the dabase' do
      before do
        login_user user
      end

      it 'does not save the new message in the database' do
      end

      it 're-renders the :index template' do
      ends
    end

    context 'in the case of not user_signed_in' do
      it 'redirects to devise/registrations#new' do
      end
    end
  end
end
