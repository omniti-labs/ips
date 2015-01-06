require 'serverspec'

# Required by serverspec under test-kitchen
set :backend, :exec

# See recipes/test_depot
describe 'The ips_depot resource' do

  context 'when the action is :create' do
    it 'should create a directory' do
      expect(file('/data/test-repo-created')).to be_directory
    end
    it 'should have the correct default publisher' do
      expect(command('pkgrepo get -Hs /data/test-repo-created -p publisher/prefix')).to match(/fancy-software/)
    end
  end

  context 'when the action is :enable_depot and the port is 10000' do
    it 'should create a directory' do
      expect(file('/data/test-repo-enabled1')).to be_directory
    end
    it 'should be listening on port 10000' do
      expect(port(10000)).to be_listening
    end
  end

  context 'when the action is :enable_depot and the port is 10002' do
    it 'should create a directory' do
      expect(file('/data/test-repo-enabled2')).to be_directory
    end
    it 'should be listening on port 10002' do
      expect(port(10002)).to be_listening
    end
  end
  
  context 'when the action is :disable_depot and the port is 10001' do
    it 'should create a directory' do
      expect(file('/data/test-repo-disabled')).to be_directory
    end
    it 'should NOT be listening on port 10001' do
      expect(port(10001)).not_to be_listening
    end
  end

  context 'when the action is :delete' do
    it 'should remove a directory' do
      expect(file('/data/test-repo-deleted')).not_to be_directory
    end
  end


end
