class Dx < Formula
  desc "Revision-based record checks and views for jj repositories"
  homepage "https://github.com/fuyutarow/dx"
  version "0.1.6"

  depends_on "git"
  depends_on "jj"

  on_macos do
    on_arm do
      # dx-0.1.6-darwin-arm64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-darwin-arm64.tar.gz"
      sha256 "02b10714c372ddeb8617709a4929d109995d6a80880559a0900b7aee65297502"
    end

    on_intel do
      # dx-0.1.6-darwin-x64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-darwin-x64.tar.gz"
      sha256 "13700b48178460a79d8d7ee2fdcddd6e60f7094ef2ecde0577eb96e52f5e5800"
    end
  end

  on_linux do
    on_arm do
      # dx-0.1.6-linux-arm64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-linux-arm64.tar.gz"
      sha256 "15ed298bba0730e5687819aeee67d8327af58f8a143f33faedd8bf087ba21602"
    end

    on_intel do
      # dx-0.1.6-linux-x64.tar.gz
      url "https://github.com/fuyutarow/dx/releases/download/v0.1.6/dx-0.1.6-linux-x64.tar.gz"
      sha256 "b3589ec8d5ecb16e71ae24a0045fbff5d885d995cd21e94c60784a4c7a1aba20"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables
  end

  test do
    assert_equal "dx #{version}", shell_output("#{bin}/dx --version").strip
  end
end
