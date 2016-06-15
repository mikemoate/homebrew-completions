class DockerCompletion < Formula
  desc "Bash, Zsh and Fish completion for Docker"
  homepage "https://github.com/docker/docker"
  url "https://github.com/docker/docker/archive/v1.11.2.tar.gz"
  sha256 "55798b258341969bea6cfc4619f00c4068695da80c800c00d10b73b3c8d522f8"
  head "https://github.com/docker/docker"

  conflicts_with "docker",
    :because => "docker already includes these completion scripts"

  bottle :unneeded

  def install
    bash_completion.install "contrib/completion/bash/docker"
    fish_completion.install "contrib/completion/fish/docker.fish"
    zsh_completion.install "contrib/completion/zsh/_docker"
  end

  test do
    assert_match "-F _docker",
      shell_output("bash -c 'source #{bash_completion}/docker && complete -p docker'")
  end
end
