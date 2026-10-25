class Dx < Formula
  version "0.1.6"
  desc "Developer experience command line tool"
  homepage "https://github.com/fuyutarow/dx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-darwin-arm64.tar.gz"
      sha256 "02b10714c372ddeb8617709a4929d109995d6a80880559a0900b7aee65297502"
    end
    on_intel do
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-darwin-x64.tar.gz"
      sha256 "13700b48178460a79d8d7ee2fdcddd6e60f7094ef2ecde0577eb96e52f5e5800"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-linux-arm64.tar.gz"
      sha256 "15ed298bba0730e5687819aeee67d8327af58f8a143f33faedd8bf087ba21602"
    end
    on_intel do
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-linux-x64.tar.gz"
      sha256 "b3589ec8d5ecb16e71ae24a0045fbff5d885d995cd21e94c60784a4c7a1aba20"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dx --version")
  end
end
