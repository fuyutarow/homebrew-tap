class Agx < Formula
  version "1.22.88"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.88/agx-1.22.88-darwin-arm64.tar.gz"
      sha256 "5b8c3fec421c40f4e7f43af85791ac3a0b474a5f7977ca8d9b2cb191e22a90b8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.88/agx-1.22.88-darwin-x64.tar.gz"
      sha256 "5c9b2f0da4725c5281300306ac0f77a4714511a1019a3bc5fd08c77a5bb5e3f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.88/agx-1.22.88-linux-arm64.tar.gz"
      sha256 "5d0cde539a410bb4ef4eb2da9f75b2f141e2c208138022a04919ab0e5ab19065"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.88/agx-1.22.88-linux-x64.tar.gz"
      sha256 "3ebcbef63bc6f26e4ae51e2389e16a09af97f40e583eb8807fe72a9de733b0cf"
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
