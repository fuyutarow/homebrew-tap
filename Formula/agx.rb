class Agx < Formula
  version "5.7.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.0/agx-5.7.0-darwin-arm64.tar.gz"
      sha256 "cb6e887c116b606896fb6f6e33b6e51a0b759f1b87eea9d5e48953b90168e9c5"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.0/agx-5.7.0-darwin-x64.tar.gz"
      sha256 "6965b2f892d8bec3ac306fdb35ff0d3ba3c5fce1f61130a9290807040d17e6a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.0/agx-5.7.0-linux-arm64.tar.gz"
      sha256 "826652bc2cc84d19d7e0c2e76bb67d145a8da326ac079ca0765683c625a74275"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.7.0/agx-5.7.0-linux-x64.tar.gz"
      sha256 "44458953fd0cfd78f07aed23bb462e27d33546bab3a3daaac1ca39a378df4671"
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
