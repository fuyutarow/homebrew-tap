class Agx < Formula
  version "1.16.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.2/agx-1.16.2-darwin-arm64.tar.gz"
      sha256 "01810849e41a17e9db6248096b29ea0e0252329fdc929b2b93ef56fbc9f61e01"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.2/agx-1.16.2-darwin-x64.tar.gz"
      sha256 "06b35ce6617df724294efb22dd468666671eb5a34adc9a3a07a7cba91d38a361"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.2/agx-1.16.2-linux-arm64.tar.gz"
      sha256 "78e1c98be3a10aeebe63fbbe1dd91e9a1de776dc14e0579c0a6ccbde14d47e2b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.16.2/agx-1.16.2-linux-x64.tar.gz"
      sha256 "ae79c4d84cb1d018ddda4ed7dd7409f6c233dd25d3561f6af9a2b7367fc11a6a"
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
