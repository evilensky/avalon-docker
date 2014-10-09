INSTALL_FFMPEG = {
  args: "--volumes-from ffmpeg", 
  cmd: "yum -y install /RPMS/x86_64/ffmpeg-libs-1.2-59a.el6.x86_64.rpm /RPMS/x86_64/ffmpeg-1.2-59a.el6.x86_64.rpm"
}

Vagrant.require_version ">= 1.6.3"

Vagrant.configure("2") do |config|
  config.vm.box = "yungsang/boot2docker"
  #config.vm.box = "centos-minimal-desktop"
  #config.vm.box_url = "http://yumrepo-public.library.northwestern.edu/centos_x86_64_minimal_desktop.box"

  config.vm.synced_folder "build", "/var/docker"

  config.vm.provision "docker" do |d|
    d.build_image "/var/docker/ffmpeg",     args: '-t ffmpeg'
    d.build_image "/var/docker/matterhorn", args: '-t matterhorn'
    d.run "ffmpeg"
    d.run "matterhorn", INSTALL_FFMPEG
  end
  
  config.vm.provision "shell", inline: "fix_mattherhorn.sh"
  
  config.vm.provision "docker" do |d|
  end
end
