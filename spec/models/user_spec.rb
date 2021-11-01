require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.admin?' do
    context 'when regular user' do
      before(:each) do
        @user = create(:user)
      end

      it 'should not be admin' do
        expect(@user.admin?).to be_falsey
      end
    end

    context 'when admin user' do
      before(:each) do
        @user = create(:user, roles: %w[USER ADMIN])
      end

      it 'should be admin' do
        expect(@user.admin?).to be_truthy
      end
    end
  end
end
