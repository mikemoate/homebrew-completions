class VagrantCompletion < Formula
  desc "Bash completion for Vagrant"
  homepage "https://github.com/mitchellh/vagrant"
  url "https://github.com/mitchellh/vagrant/archive/v1.8.4.tar.gz"
  sha256 "a5ded3bc343ac1f30e09decab0c844639de45b16578600bdc4a0cdfe73b4d223"

  head "https://github.com/mitchellh/vagrant.git"

  bottle :unneeded

  def install
    bash_completion.install "contrib/bash/completion.sh" => "vagrant"
  end

  test do
    assert_match "-F _vagrant",
      shell_output("source #{bash_completion}/vagrant && complete -p vagrant")
  end
end
