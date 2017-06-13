require 'rails_helper'

describe MessagesController, type: :controller do

  let(:user) {create(:user)}
  let(:group) {create(:group)}
  let(:message) {create(:message)}

  describe 'GET #index' do
    context 'in the case of user_signed_in' do
      before do
        login_user user
      end

      it "assigns the requested group to @group" do
        get :index, params: { group_id: group.id }
        expect(assigns(:group)).to eq group
      end

      it "render is the :index template" do
        get :index, params:{ group_id: group.id }
        expect(response).to render_template :index
      end

      it "assigns a new Message to @message" do
        message = Message.new
        get :index, params:{ group_id: group.id }
        expect(assigns(:message)).to be_a_new(Message)
      end
    end

    context 'in the case of not user_signed_in' do
      it "redirects to new_user_registration_path" do
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'in the case of user_signed_in & saves the message in the database' do
      before  :each do
        login_user user
      end

      it 'saves the new messages in the database' do
          expect{
          post :create, params: { group_id: group.id, user_id: user.id, message: attributes_for(:message) }
          }.to change(Message, :count).by(1)
      end

      it 'redirects to messages#index' do
         post :create,
         params: { group_id: group.id, user_id: user.id, message: attributes_for(:message) }
         expect(response).to redirect_to group_messages_path
      end
    end

    context 'in the case of user_signed_in & could not save the massage in the dabase' do
      before  :each do
        login_user user
      end

      it 'does not save the new message in the database' do
          expect{
          post :create, params: { group_id: group.id, user_id: user.id, message: attributes_for(:message, text:nil, image: nil) }
          }.not_to change(Message, :count)
      end

      it 're-renders the :index template' do
         post :create, params: { group_id: group.id, user_id: user.id, message: attributes_for(:message, text:nil, image: nil) }
         expect(response).to render_template :index
      end
    end
    context 'in the case of not user_signed_in' do
      it 'redirects to new_user_session_path' do
        post :create,
        params: { group_id: group.id, user_id: user.id, message: attributes_for(:message) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
