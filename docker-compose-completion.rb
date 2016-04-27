class DockerComposeCompletion < Formula
  desc "docker-compose completion script"
  homepage "https://docs.docker.com/compose/completion/"
  url "https://github.com/docker/compose/archive/1.7.1.tar.gz"
  sha256 "002be1c4cd22f73cee219e97e97dfd6b9ff7bfd8dbb40c0aa31c55e5e1a965e5"
  head "https://github.com/docker/compose.git"

  conflicts_with "docker-compose",
    :because => "docker-compose already includes completion scripts"

  bottle :unneeded

  def install
    bash_completion.install "contrib/completion/bash/docker-compose"
    zsh_completion.install "contrib/completion/zsh/_docker-compose"
  end

  test do
    assert_match "-F _docker_compose",
      shell_output("bash -c 'source #{bash_completion}/docker-compose && complete -p docker-compose'")
  end
end
