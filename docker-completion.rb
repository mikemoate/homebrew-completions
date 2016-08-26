class DockerCompletion < Formula
  desc "Bash, Zsh and Fish completion for Docker"
  homepage "https://github.com/docker/docker"
  url "https://github.com/docker/docker/archive/v1.12.0.tar.gz"
  sha256 "f8139acba98248eb1fdb0b6d94efee89b876f9a50d00e263dc144fd2b0c372d4"
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
