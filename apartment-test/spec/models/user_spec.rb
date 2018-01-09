require 'spec_helper'

describe User do
  describe '#has_role_on_site?' do
    let!(:user) { create :user }

    context 'when user has a role on passed in site' do
      before { user.roles << Role.create(name: 'full_admin', site_key: 'test_site') }
      it 'should return true' do
        expect(user.has_role_on_site?('test_site')).to eq(true)
      end
      it 'should return false for the wrong role name' do
        expect(user.has_role_on_site?('test_site', 'page_admin')).to eq(false)
      end
      it 'should return true for the correct role name' do
        expect(user.has_role_on_site?('test_site', 'full_admin')).to eq(true)
      end
      it 'should return true for one of the correct role names' do
        expect(user.has_role_on_site?('test_site', 'full_admin', 'page_admin')).to eq(true)
      end
    end
  end
end
