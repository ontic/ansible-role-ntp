Vagrant.configure('2') do |config|
	
	config.vm.define 'ubuntu' do |server|
		
		server.vm.box = 'ubuntu1404'
		server.vm.box_check_update = false
		server.ssh.forward_agent = true
		server.ssh.insert_key = false
		
		server.vm.provider 'virtualbox' do |box|
			box.memory = 512
			box.cpus = 1
		end
		
		server.vm.provider 'vmware_workstation' do |box|
			box.vmx['memsize'] = '512'
			box.vmx['numvcpus'] = '1'
		end
		
		if Vagrant::Util::Platform.windows?
			server.vm.provision 'shell' do |shell|
				shell.path = '~/ansible-windows/provision.sh'
				shell.args = 'tests/playbook.yml tests/inventory'
			end
		else
			server.vm.provision 'ansible' do |ansible|
				ansible.playbook = 'tests/playbook.yml'
				ansible.inventory_path = 'tests/inventory'
				ansible.sudo = true
			end
		end
	end
	
	config.vm.define 'centos' do |server|
    	
		server.vm.box = 'centos71'
		server.vm.box_check_update = false
		server.ssh.forward_agent = true
		server.ssh.insert_key = false
		
		server.vm.provider 'virtualbox' do |box|
			box.memory = 512
			box.cpus = 1
		end
		
		server.vm.provider 'vmware_workstation' do |box|
			box.vmx['memsize'] = '512'
			box.vmx['numvcpus'] = '1'
		end
		
		if Vagrant::Util::Platform.windows?
			server.vm.provision 'shell' do |shell|
				shell.path = '~/ansible-windows/provision.sh'
				shell.args = 'tests/playbook.yml tests/inventory'
			end
		else
			server.vm.provision 'ansible' do |ansible|
				ansible.playbook = 'tests/playbook.yml'
				ansible.inventory_path = 'tests/inventory'
				ansible.sudo = true
			end
		end
	end
	
end