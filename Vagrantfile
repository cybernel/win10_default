# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "Win10MSEdge"
	config.vm.guest = :windows
  config.vm.communicator = ENV['communicator'] || "winrm"
	config.winrm.username = "IEUser"
  config.winrm.password = "Passw0rd!"
  config.vm.boot_timeout = 600
  config.vm.graceful_halt_timeout = 600
	config.ssh.username="IEUser"
	config.ssh.password="Passw0rd!"
	config.ssh.insert_key = false
  config.ssh.sudo_command = ''
	config.ssh.shell = 'sh -l'

  config.vm.network :forwarded_port, guest: 3389, host: 3389
  config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

  config.vm.provider "virtualbox" do |v|
   v.customize ["modifyvm", :id, "--vram", "128"]
   v.customize ["modifyvm", :id, "--memory", 2048]
   v.customize ["modifyvm", :id, "--cpus", 2]
   v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
   v.customize ["modifyvm", :id, "--accelerate3d", "on"]
  end

##Install extras
## After boot, use command "vagrant provision --provision-with firefox,putty" to selectively install
  config.vm.provision "choco", type: "shell" do |s|
  s.inline = 'write-host "================ Installing Choco ================" ; C:\vagrant\choco.ps1'
  end

  config.vm.provision "vguest", type: "shell" do |s|
  s.inline = 'write-host "================ Installing virtualbox-guest-additions ================" ; choco install virtualbox-guest-additions-guest.install -y'
  end

  config.vm.provision "googlechrome", type: "shell" do |s|
  s.inline = 'write-host "================ Installing googlechrome ================" ; choco install googlechrome -y'
  end

  config.vm.provision "firefox", type: "shell" do |s|
  s.inline = 'write-host "================ Installing firefox ================" ; choco install firefox -y'
  end

  config.vm.provision "putty", type: "shell" do |s|
  s.inline = 'write-host "================ Installing putty ================" ; choco install putty -y'
  end

  config.vm.provision "7zip", type: "shell" do |s|
  s.inline = 'write-host "================ Installing 7zip ================" ; choco install 7zip -y'
  end

  config.vm.provision "wireshark", type: "shell" do |s|
  s.inline = 'write-host "================ Installing wireshark ================" ; choco install wireshark -y'
  end 

  config.vm.provision "pstools", type: "shell" do |s|
  s.inline = 'write-host "================ Installing pstools ================" ; c:\vagrant\pstools.ps1'
  end

  config.vm.provision "restart", type: "shell" do |s|
  s.inline = 'write-host "================ Restart Computer ================" ; restart-computer -force'
  end


end
