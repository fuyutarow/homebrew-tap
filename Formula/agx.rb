class Agx < Formula
  version "1.13.12"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.12/agx-1.13.12-darwin-arm64.tar.gz"
      sha256 "35c1e946ed7d7233fcfe255ad3876538ed373ad8558fdc4c89a46881996e2080"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.12/agx-1.13.12-darwin-x64.tar.gz"
      sha256 "8b07a63b8ff5574e434e4891e84c25471443d3ff3c99c027b6d406342fba4785"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.12/agx-1.13.12-linux-arm64.tar.gz"
      sha256 "389c3b9f2ec82acb2fa76ed0cb84bb58ac5f2354bef73b6652bdd407da274f1d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.12/agx-1.13.12-linux-x64.tar.gz"
      sha256 "7e14d53eaf2c47fcca58f7b40b3c9cbbaf3cde5eb509ea0461f2af92557a9c67"
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
