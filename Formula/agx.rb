class Agx < Formula
  version "5.7.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.1/agx-5.7.1-darwin-arm64.tar.gz"
      sha256 "71f68e26582790f0146a6c8cab4814e51795edebb1a32e9095dd9b6b940d1f72"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.1/agx-5.7.1-darwin-x64.tar.gz"
      sha256 "272ef025da6b25b8545919ccfdfd5963f8cdf638e9eeec2586ef287d37346c9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.1/agx-5.7.1-linux-arm64.tar.gz"
      sha256 "c882b7ff52ea1fc16d5d1c819bf75ad245c272187a7b70545db87d885f6eaa5b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.1/agx-5.7.1-linux-x64.tar.gz"
      sha256 "2af4576a705626d89fed0b93034c964e3d0096a04f35a8576a3be7797fe3e824"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
