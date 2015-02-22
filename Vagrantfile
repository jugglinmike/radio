Vagrant.configure('2') do |config|
  config.ssh.forward_x11 = true # useful since some audio testing programs use x11
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.provision 'shell', path: 'provision.sh'

  # enable audio drivers on VM settings
  config.vm.provider :virtualbox do |vb|
    vb.customize [
      'modifyvm', :id, '--audio', 'alsa',
      # choices: hda sb16 ac97
      '--audiocontroller', 'ac97'
    ]
  end
end
