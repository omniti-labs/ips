require 'serverspec'

# Required by serverspec under test-kitchen
set :backend, :exec

# See recipes/test_publisher
fixtures = {
  :deleted => 'ms.omniti.com',
  :created => 'perl.omniti.com',
}

describe 'The ips_publisher resource' do

  context 'when the action is :delete' do

    it 'should be a known publisher' do
      cmd = command("pkg publisher #{fixtures[:deleted]}")
      expect(cmd.exit_status).to be(0)
    end

    it 'should not appear in the list of enabled publishers' do
      cmd = command('pkg publisher -n')
      expect(cmd.stdout).not_to match(/#{fixtures[:deleted]}/)
    end

  end

  context 'when the action is :create' do

    it 'should be a known publisher' do
      cmd = command("pkg publisher #{fixtures[:created]}")
      expect(cmd.exit_status).to be(0)
    end

    it 'should appear in the list of enabled publishers' do
      cmd = command('pkg publisher -n')
      expect(cmd.stdout).to match(/#{fixtures[:created]}/)
    end

  end
  
end
