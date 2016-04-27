class DockerCompletion < Formula
  desc "Bash, Zsh and Fish completion for Docker"
  homepage "https://github.com/docker/docker"
  url "https://github.com/docker/docker/archive/v1.11.1.tar.gz"
  sha256 "04de3750738b6f888f03520fb67db22e95e8a8e016ae901428e6c5791c9841cc"
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
